import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:fspace/app.dart';
import 'package:fspace/generated/l10n/l10n.dart';
import 'package:fspace/managers/preferences_manager.dart';
import 'package:fspace/models/app_info_model.dart';
import 'package:fspace/network/api_client.dart';
import 'package:fspace/providers/app_user_provider.dart';
import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:fspace/utils/logger_util.dart';

final String _tag = 'IAPPaymentManager';

void completePurchase(PurchaseDetails purchase) {
  if (Platform.isAndroid && purchase is! GooglePlayPurchaseDetails) {
    return;
  }
  InAppPurchase.instance.completePurchase(purchase);
}

class IAPPaymentManager {
  StreamSubscription<List<PurchaseDetails>>? _purchaseUpdated;
  final List<IAPPaymentHandler> _handlers = [];

  final AppInfoModel appInfo;

  IAPPaymentManager(this.appInfo) {
    _loadHandlers();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      for (var e in _handlers) {
        e.submitIfNeed();
      }
    });
  }

  void listen() {
    _purchaseUpdated?.cancel();
    _purchaseUpdated = InAppPurchase.instance.purchaseStream
        .listen(_onPurchaseUpdated, onDone: () => _purchaseUpdated?.cancel());
  }

  void _onPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    final handlers = List<IAPPaymentHandler>.from(_handlers);
    for (final e in purchaseDetailsList) {
      Logger.info(
          '订单状态变化，purchaseID：${e.purchaseID}，productID: ${e.productID}, status：${e.status}, ${e.transactionDate}',
          tag: _tag);
      if (_handlers.isEmpty) {
        // hanlder为空，未知订单，直接完成
        completePurchase(e);
        Logger.info(
            '未知订单，purchaseID：${e.purchaseID}，status：${e.status}, ${e.transactionDate}',
            tag: _tag);
        continue;
      }
      switch (e.status) {
        case PurchaseStatus.pending:
          final index =
              handlers.lastIndexWhere((e1) => e1.productId == e.productID);
          if (index != -1) {
            handlers[index].orderPending();
          }
        case PurchaseStatus.purchased:
          // 此处需要从后往前查找，由于没得一个标识能完全匹配上handler
          // 如果队列有卡单，从前向后找大几率要匹配错，导致回调orderId对不上
          final aIndex = handlers.lastIndexWhere(
              (e1) => e1.isWaitPurchase && e1.productId == e.productID);
          if (aIndex != -1) {
            handlers[aIndex].orderPurchased(e);
          } else {
            // 未知订单，直接完成
            completePurchase(e);
            Logger.info(
                '未知订单，purchaseID：${e.purchaseID}，status：${e.status}, ${e.transactionDate}',
                tag: _tag);
          }
        case PurchaseStatus.restored:
          // 苹果内购2.0，已购买有可能是restored状态
          if (Platform.isIOS) {
            final aIndex = handlers.lastIndexWhere(
                (e1) => e1.isWaitPurchase && e1.productId == e.productID);
            if (aIndex != -1) {
              handlers[aIndex].orderPurchased(e);
            } else {
              // 未知订单，直接完成
              completePurchase(e);
              Logger.info(
                  '未知订单，purchaseID：${e.purchaseID}，status：${e.status}, ${e.transactionDate}',
                  tag: _tag);
            }
          } else {
            var handle = false;
            for (var h in handlers) {
              if (h.orderRestored(e)) {
                handle = true;
                break;
              }
            }
            if (!handle) completePurchase(e);
          }
        case PurchaseStatus.error:
          if ((e.purchaseID?.isEmpty ?? true) && e.productID.isEmpty) {
            // 信息为空，直接取消最后一个订单
            if (handlers.isNotEmpty) {
              handlers.last.orderError(e, force: true);
            }
            break;
          }
          // 优先按productId定位handler；当尚未记录purchaseId时，允许强制匹配
          final errIndex =
              handlers.lastIndexWhere((h) => h.productId == e.productID);
          if (errIndex != -1) {
            final h = handlers[errIndex];
            h.orderError(e, force: h.isWaitPurchase);
          } else {
            // 回退处理，防止遗漏导致界面状态卡住
            if (handlers.isNotEmpty) handlers.last.orderError(e, force: true);
          }
        case PurchaseStatus.canceled:
          if ((e.purchaseID?.isEmpty ?? true) && e.productID.isEmpty) {
            // 安卓弹出购买弹窗后，直接取消，purchaseID和productID是空的
            // 信息为空，直接取消最后一个订单
            if (handlers.isNotEmpty) {
              handlers.last.orderCanceled(e, force: true);
            }
            break;
          }
          // 优先按productId定位handler；当尚未记录purchaseId时，允许强制匹配
          final cancelIndex =
              handlers.lastIndexWhere((h) => h.productId == e.productID);
          if (cancelIndex != -1) {
            final h = handlers[cancelIndex];
            h.orderCanceled(e, force: h.isWaitPurchase);
          } else {
            // 回退处理，防止遗漏导致界面状态卡住
            if (handlers.isNotEmpty) {
              handlers.last.orderCanceled(e, force: true);
            }
          }
      }
    }
  }

  Future<void> pay({
    required String productId,
    required String orderId,
    required num price,
    ValueChanged<PurchaseStatus>? onStateChanged,
    required bool consumable,
  }) async {
    final isAvailable = await InAppPurchase.instance.isAvailable();
    if (!isAvailable) {
      throw t.common.applyPayUnavailable;
    }
    final handler = IAPPaymentHandler(
      appInfo: appInfo,
      productId: productId,
      orderId: orderId,
      price: price,
      payTimestamp: DateTime.now().millisecondsSinceEpoch,
      onStateChanged: onStateChanged,
    );
    _handlers.add(handler);
    _saveHandlers();
    Logger.info('创建Handler, 总数${_handlers.length}', tag: _tag);
    _listenHandler(handler);
    return handler.pay(consumable: consumable);
  }

  void _listenHandler(IAPPaymentHandler handler) {
    handler.handlerChanged = () {
      _saveHandlers();
    };
    handler.onComplated = (e) {
      _handlers.remove(e);
      Logger.info('移出Handler, 总数${_handlers.length}', tag: _tag);
      _saveHandlers();
    };
  }

  void _saveHandlers() {
    final obj = _handlers.map((e) {
      return {
        'orderId': e.orderId,
        'productId': e.productId,
        'price': e.price,
        'payTimestamp': e.payTimestamp,
        'purchaseId': e.purchaseId,
        'ticks': e.ticks,
        'originalPurchaseId': e.originalPurchaseId,
      };
    }).toList();
    final jsonString = jsonEncode(obj);
    PreferencesManager.instance.setString('iap_info_new', jsonString);
  }

  void _loadHandlers() {
    final jsonString = PreferencesManager.instance.getString('iap_info_new');
    if (jsonString == null) return;
    final obj = jsonDecode(jsonString);
    if (obj is! List) return;
    final handlers = obj
        .map((e) => IAPPaymentHandler(
              appInfo: appInfo,
              orderId: e['orderId'],
              productId: e['productId'],
              price: e['price'],
              payTimestamp: e['payTimestamp'],
              purchaseId: e['purchaseId'],
              ticks: e['ticks'],
              originalPurchaseId: e['originalPurchaseId'],
            ))
        .filter((e) =>
            // 超过10天还没处理掉handler，表示无效handler，直接移除
            (DateTime.now().millisecondsSinceEpoch - e.payTimestamp).abs() <
            10 * 24 * 60 * 60 * 1000)
        .toList();

    for (var e in handlers) {
      _listenHandler(e);
    }
    _handlers.addAll(handlers);
    Logger.info('获取Handler, 总数${_handlers.length}', tag: _tag);
  }
}

class IAPPaymentHandler {
  final AppInfoModel appInfo;
  final String orderId;
  final String productId;
  final int payTimestamp;
  final num? price;

  String? _purchaseId;
  String? get purchaseId => _purchaseId;

  String? _originalPurchaseId;
  String? get originalPurchaseId => _originalPurchaseId;

  /// 支付成功才有值
  String? _ticks;
  String? get ticks => _ticks;

  Completer<dynamic>? _payCallback;
  ValueChanged<IAPPaymentHandler>? onComplated;
  VoidCallback? handlerChanged;
  ValueChanged<PurchaseStatus>? onStateChanged;

  bool get isWaitPurchase => _purchaseId == null;
  bool _isComplated = false;

  int _submitRetryCount = 0;
  final int _submitRetryMaxCount = 5;

  bool _isSubmiting = false;
  PurchaseDetails? _details;

  IAPPaymentHandler({
    required this.appInfo,
    required this.orderId,
    required this.productId,
    required this.payTimestamp,
    this.price,
    String? purchaseId,
    String? ticks,
    String? originalPurchaseId,
    this.onStateChanged,
  })  : _purchaseId = purchaseId,
        _ticks = ticks,
        _originalPurchaseId = originalPurchaseId;

  Future<void> pay({required bool consumable}) async {
    PurchaseParam purchaseParam;
    ProductDetails firstProduct;
    ChangeSubscriptionParam? changeSubscriptionParam;
    bool isBuySuccess;

    Logger.info(
        '准备发起购买，platform: ${Platform.isAndroid ? 'Android' : 'iOS'}, productId: $productId, consumable: $consumable, orderId: $orderId',
        tag: _tag);

    _payCallback = Completer();
    // 查询“productId”组下的商品方案信息
    InAppPurchase.instance.queryProductDetails({productId}).then(
      (response) async {
        if (response.productDetails.isEmpty) {
          _payCallback?.completeError(t.common.applePayNotFondProduct);
          onComplated?.call(this);
          return;
        }
        firstProduct = response.productDetails.first;

        for (var item in response.productDetails) {
          Logger.info(
              '配置商品信息 id: ${item.id} title: ${item.title} price: ${item.price} rawPrice: ${item.rawPrice} currencyCode: ${item.currencyCode} currencySymbol: ${item.currencySymbol} description: ${item.description}',
              tag: _tag);
        }

        // Android 订阅：如存在历史订阅，则使用 changeSubscriptionParam 进行切换
        if (Platform.isAndroid && !consumable) {
          final oldSubscription =
              await _getOldSubscription(currentProductId: productId);
          if (oldSubscription != null) {
            changeSubscriptionParam = ChangeSubscriptionParam(
              oldPurchaseDetails: oldSubscription,
              replacementMode: ReplacementMode.chargeFullPrice,
            );

            /// replacementMode
            ///- 当前策略：chargeFullPrice（新订阅立即生效并按新方案全额计费，旧订阅按 Google 规则处理）。
            // - 若需其他模式（例如 deferred/withoutProration），请在此处调整 replacementMode。
            Logger.info(
                'Google Play -> 检测到旧订阅，使用变更订阅流程（replacementMode=chargeFullPrice） oldPurchaseID: ${oldSubscription.purchaseID}, oldProductID: ${oldSubscription.productID}, transactionDate: ${oldSubscription.transactionDate}',
                tag: _tag);
          } else {
            Logger.info('Google Play -> 未检测到旧订阅，将使用新购订阅流程', tag: _tag);
          }

          purchaseParam = GooglePlayPurchaseParam(
            productDetails: firstProduct,
            changeSubscriptionParam: changeSubscriptionParam,
            applicationUserName: formatToUUID(orderId),
          );
        } else {
          purchaseParam = PurchaseParam(
            productDetails: firstProduct,
            applicationUserName: formatToUUID(orderId),
          );
        }
        try {
          Logger.info(
              '拉起购买 -> 商品消耗类型: ${consumable ? 'consumable' : 'non-consumable'}',
              tag: _tag);
          if (consumable) {
            isBuySuccess = await InAppPurchase.instance
                .buyConsumable(purchaseParam: purchaseParam);
          } else {
            isBuySuccess = await InAppPurchase.instance
                .buyNonConsumable(purchaseParam: purchaseParam);
          }
          if (isBuySuccess && Platform.isAndroid) {
            // 安卓内购没得Pending状态，为了与苹果统一手动触发此状态
            orderPending();
          }
        } catch (e, s) {
          onComplated?.call(this);
          if (e is PlatformException &&
              e.code == 'storekit2_purchase_cancelled') {
            _payCallback?.completeError(t.common.applePayCancel);
          } else {
            _payCallback?.completeError(e);
          }
          Logger.error("拉起购买失败 error: $e , stackTrace: $s");
        }
      },
    ).onError((error, stackTrace) {
      onComplated?.call(this);
      _payCallback?.completeError(t.common.applePayNotFondProduct);
      Logger.error("查询商品失败 error: $error, stackTrace: $stackTrace");
    });
    return _payCallback!.future;
  }

  void orderPending() {
    Logger.info(
        '订单进入Pending，orderId：$orderId, productId：$productId, purchaseID：$_purchaseId',
        tag: _tag);
    onStateChanged?.call(PurchaseStatus.pending);
  }

  /// 查询旧的 Google 订阅（若存在），用于升级/降级。
  /// 返回与当前欲购买 `currentProductId` 不同的、最近一次的订阅记录。
  Future<GooglePlayPurchaseDetails?> _getOldSubscription(
      {required String currentProductId}) async {
    try {
      Logger.info(
          'Google Play -> 检查是否存在旧订阅... currentProductId: $currentProductId',
          tag: _tag);
      final androidAddition = InAppPurchase.instance
          .getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
      final resp = await androidAddition.queryPastPurchases();
      Logger.info('Google Play -> 历史购买记录总数: ${resp.pastPurchases.length}',
          tag: _tag);
      final rawCandidates = resp.pastPurchases
          .whereType<GooglePlayPurchaseDetails>()
          .where((p) => p.productID != currentProductId)
          .toList();
      Logger.info('Google Play -> 候选旧订阅数量（排除当前商品）: ${rawCandidates.length}',
          tag: _tag);
      if (rawCandidates.isEmpty) return null;

      // 过滤：仅保留「已确认(acknowledged)」且「已购买(purchased)」且「存在本地 purchaseToken」的记录
      final filtered = <GooglePlayPurchaseDetails>[];
      for (final p in rawCandidates) {
        try {
          final bc = p.billingClientPurchase;
          final ack = bc.isAcknowledged == true;
          final stateOk = bc.purchaseState == PurchaseStateWrapper.purchased;
          final token = p.verificationData.serverVerificationData;
          final tokenOk = token.isNotEmpty;
          Logger.info(
              'Google Play -> 校验旧订阅 candidate purchaseID: ${p.purchaseID}, productID: ${p.productID}, acknowledged: ${bc.isAcknowledged}, state: ${bc.purchaseState}, tokenEmpty: ${!tokenOk}',
              tag: _tag);
          if (ack && stateOk && tokenOk) {
            filtered.add(p);
          }
        } catch (e) {
          Logger.info(
              'Google Play -> 跳过不合法旧订阅记录 purchaseID: ${p.purchaseID}, productID: ${p.productID}, error: $e',
              tag: _tag);
        }
      }
      Logger.info('Google Play -> 过滤后有效旧订阅数量: ${filtered.length}', tag: _tag);
      if (filtered.isEmpty) return null;

      // 优先选择「当前活跃（autoRenewing）」，否则按最近交易时间选择
      final active = filtered
          .where((p) => p.billingClientPurchase.isAutoRenewing == true)
          .toList();
      Logger.info('Google Play -> 活跃（autoRenewing=true）旧订阅数量: ${active.length}',
          tag: _tag);

      GooglePlayPurchaseDetails picked;
      if (active.isNotEmpty) {
        active.sort((a, b) {
          final ta = int.tryParse(a.transactionDate ?? '0') ?? 0;
          final tb = int.tryParse(b.transactionDate ?? '0') ?? 0;
          return tb.compareTo(ta);
        });
        picked = active.first;
      } else {
        filtered.sort((a, b) {
          final ta = int.tryParse(a.transactionDate ?? '0') ?? 0;
          final tb = int.tryParse(b.transactionDate ?? '0') ?? 0;
          return tb.compareTo(ta);
        });
        picked = filtered.first;
      }

      Logger.info(
          'Google Play -> 选取旧订阅 oldPurchaseID: ${picked.purchaseID}, oldProductID: ${picked.productID}, transactionDate: ${picked.transactionDate}, autoRenewing: ${picked.billingClientPurchase.isAutoRenewing}',
          tag: _tag);
      return picked;
    } catch (_) {
      Logger.info('Google Play -> 查询旧订阅失败或不存在旧订阅', tag: _tag);
      return null;
    }
  }

  void orderPurchased(PurchaseDetails details) {
    if (_purchaseId != null) return;
    onStateChanged?.call(PurchaseStatus.purchased);
    _purchaseId = details.purchaseID;
    if (Platform.isAndroid) {
      _ticks = details.verificationData.localVerificationData;
    } else {
      _ticks = details.verificationData.serverVerificationData;
    }
    if (details is AppStorePurchaseDetails) {
      _originalPurchaseId = details
          .skPaymentTransaction.originalTransaction?.transactionIdentifier;
    }
    Logger.info(
        '订单Purchased，更新凭证与原始交易号，orderId：$orderId, purchaseID：$_purchaseId, productId：$productId, originalPurchaseId：$_originalPurchaseId',
        tag: _tag);
    _details = details;
    handlerChanged?.call();
    if (!_isSubmiting) {
      _submitPaymentResult();
    }
  }

  bool orderRestored(PurchaseDetails details) {
    if (!isHandler(details)) return false;
    onStateChanged?.call(PurchaseStatus.restored);
    _complation();
    completePurchase(details);
    return true;
  }

  void orderError(PurchaseDetails details, {bool force = false}) {
    if (!force && !isHandler(details)) return;
    onStateChanged?.call(PurchaseStatus.error);
    _complation(error: t.common.applePayPayFail);
    if (Platform.isIOS) {
      // 安卓出错状态不需要处理订单
      completePurchase(details);
    }
  }

  void orderCanceled(PurchaseDetails details, {bool force = false}) {
    if (!force && !isHandler(details)) return;
    onStateChanged?.call(PurchaseStatus.canceled);
    _complation(error: t.common.applePayCancel);
    if (Platform.isIOS) {
      // 安卓取消状态不需要处理订单
      completePurchase(details);
    }
  }

  bool isHandler(PurchaseDetails details) {
    return details.purchaseID == _purchaseId && details.productID == productId;
  }

  void _complation({dynamic error}) {
    if (_isComplated) return;
    _isComplated = true;
    if (error != null) {
      _payCallback?.completeError(error);
    } else {
      _payCallback?.complete();
    }
    onComplated?.call(this);
  }

  void submitIfNeed() {
    if (_purchaseId == null || _ticks == null) return;
    _submitPaymentResult();
  }

  void _submitPaymentResult() async {
    if (_purchaseId == null || _ticks == null) {
      Logger.info(
          '订单状态异常，orderId：$orderId, productId：$productId, purchaseID：$_purchaseId',
          tag: _tag);
      return;
    }
    _isSubmiting = true;
    _submitRetryCount += 1;

    try {
      Logger.info(
          '订单开始回调，orderId：$orderId, purchaseID：$_purchaseId, productId：$productId',
          tag: _tag);
      final user = getUser();
      if (Platform.isIOS) {
        await getIt<ApiClient>().submitIAPAppleVerify(params: {
          'Ticks': _ticks!,
          'PayID': _purchaseId!,
          'OrderID': orderId,
          'UserID': user?.id ?? '',
          'DeviceID': appInfo.deviceId,
          'GoodsID': productId,
        });
      } else if (Platform.isAndroid) {
        // Todo Android这里也需要主动请求后端校验
        await getIt<ApiClient>().submitIAPAndroidVerify(params: {
          'Ticks': _ticks!,
          'PayID': _purchaseId!,
          'OrderID': orderId,
          'UserID': user?.id ?? '',
          'DeviceID': appInfo.deviceId,
          'GoodsID': productId,
        });
      }

      if (_details != null) {
        completePurchase(_details!);
        _details = null;
      }
      _complation();
      Logger.info(
          '订单完成，orderId：$orderId，purchaseID：$_purchaseId, productId：$productId, originalPurchaseId：$_originalPurchaseId',
          tag: _tag);
    } catch (e) {
      // 服务端明确了错误码，此时凭证是异常的，应该销毁无效凭证
      if (e is DioException && e.response?.data['code'] != null) {
        Logger.info(
            '订单回调出错，结束订单流程，orderId：$orderId，purchaseID：$_purchaseId, productId：$productId，${e.toString()}',
            tag: _tag);
        if (_details != null) {
          completePurchase(_details!);
          _details = null;
        }
        _complation(error: e);
      } else {
        if (_submitRetryCount < _submitRetryMaxCount) {
          Logger.info(
              '订单回调出错，orderId：$orderId，purchaseID：$_purchaseId, productId：$productId，${e.toString()}，准备重试 $_submitRetryCount/$_submitRetryMaxCount',
              tag: _tag);
          _submitPaymentResult();
        } else {
          Logger.info(
              '订单回调出错，orderId：$orderId，purchaseID：$_purchaseId, productId：$productId，${e.toString()}',
              tag: _tag);
          handlerChanged?.call();
          _payCallback?.completeError(e);
        }
      }
    }
  }

  // 字符串转uuid 例如：'76e6ebcfb08442aa995fc56afa048f28' -> '76e6ebcf-b084-42aa-995f-c56afa048f28'
  String formatToUUID(String input) {
    // 先移除所有非16进制字符
    final hex = input.replaceAll(RegExp(r'[^0-9a-fA-F]'), '');
    // 补齐32位
    final padded = hex.padRight(32, '0').substring(0, 32);
    // 按uuid格式拼接
    return '${padded.substring(0, 8)}-'
        '${padded.substring(8, 12)}-'
        '${padded.substring(12, 16)}-'
        '${padded.substring(16, 20)}-'
        '${padded.substring(20, 32)}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IAPPaymentHandler &&
        other.orderId == orderId &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^ productId.hashCode;
  }
}
