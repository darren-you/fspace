import 'dart:async';
import 'dart:io';

import 'package:fspace/utils/logger_util.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

final String _tag = 'PermissionManager';

class PermissionRequest {
  final Permission service;
  final Completer<PermissionStatus> callback;

  PermissionRequest({
    required this.service,
    required this.callback,
  });
}

class PermissionManager {
  /// 是否已经请求过相册权限
  static bool haveRequestAlbumPermission = false;

  static final instance = PermissionManager();

  final List<PermissionRequest> _requests = [];
  bool isRequesting = false;

  /// 使用permission_handler处理权限申请
  /// 仅在PermissionManager内部使用
  Future<PermissionStatus> _enqueue(Permission service) async {
    final completer = Completer<PermissionStatus>();
    _requests.add(PermissionRequest(service: service, callback: completer));
    _start();
    return completer.future;
  }

  /// 开始申请权限
  void _start() async {
    if (_requests.isEmpty) return;
    if (isRequesting) return;
    isRequesting = true;
    PermissionRequest? r = _requests[0];
    while (r != null) {
      await _request(r);
      if (_requests.isNotEmpty) {
        _requests.removeAt(0);
      }
      if (_requests.isNotEmpty) {
        r = _requests[0];
      } else {
        r = null;
      }
    }
    isRequesting = false;
  }

  Future<void> _request(PermissionRequest r) async {
    Logger.debug('permission_handler 请求权限 ${r.service}', tag: _tag);
    try {
      final status = await r.service.request();
      r.callback.complete(status);
    } catch (e) {
      r.callback.completeError(e);
      Logger.error('permission_handler 请求权限出错 error: $e', tag: _tag);
    }
  }

  /// 申请相册权限
  /// 仅在内部调用，保证只被调用一次（Google审核需要）
  Future<bool> _requestPhotoAlbumPermission(
      {Function()? onPermissionDenied}) async {
    Logger.debug('相册权限 开始请求🚀🚀🚀 > > >', tag: _tag);
    haveRequestAlbumPermission = true;

    final PermissionState ps = await PhotoManager.requestPermissionExtend();

    Logger.debug('相册权限 授权状态📱📱📱: ${ps.name}', tag: _tag);

    // 完整、部分访问权限
    if (ps.hasAccess) {
      if (ps == PermissionState.limited) {
        Logger.warning('相册权限 申请状态 > > > 已授权部分权限⚠️⚠️⚠️', tag: _tag);
      } else if (ps == PermissionState.authorized) {
        Logger.info('相册权限 申请状态 > > > 已授权完整权限✅✅✅', tag: _tag);
      }
      return true;
    }

    // 权限被拒绝
    onPermissionDenied?.call();
    Logger.error('相册权限 申请状态 > > > 权限被拒绝❌❌❌', tag: _tag);
    return false;
  }

  /// 检查相册权限是否被拒绝
  /// 外部调用，保证了只请求一次权限
  static Future<bool> checkPhotoPermission() async {
    if (!PermissionManager.haveRequestAlbumPermission) {
      Logger.info('相册权限 首次请求➡️➡️➡️', tag: _tag);
      final firstRequest =
          await PermissionManager.instance._requestPhotoAlbumPermission();
      return firstRequest;
    }

    final PermissionState ps = await PhotoManager.getPermissionState(
      requestOption: const PermissionRequestOption(),
    );
    Logger.warning('相册权限 查询状态 > > > ${ps.name}', tag: _tag);

    // 完整、部分访问权限
    if (ps.hasAccess) {
      // 受限访问
      if (ps == PermissionState.limited) {
        Logger.warning('相册权限 查询状态 > > > 已授权部分权限⚠️⚠️⚠️', tag: _tag);
      } else if (ps == PermissionState.authorized) {
        Logger.info('相册权限 查询状态 > > > 已授权完整权限✅✅✅', tag: _tag);
      }

      return true;
    } else {
      // 拒绝权限
      Logger.error('麦克风权限 查询状态 > > > 被拒绝❌❌❌', tag: _tag);
      return false;
    }
  }

  /// 获取相册是否为部分授权状态
  static Future<bool> isPhotoLimitPermission() async {
    final PermissionState ps = await PhotoManager.getPermissionState(
        requestOption: const PermissionRequestOption());
    if (ps == PermissionState.limited) {
      Logger.warning('相册权限 获取状态 > > > 已授权部分权限⚠️⚠️⚠️', tag: _tag);
      return true;
    }

    return false;
  }

  Future<bool> requestMicrophonePermission(
      {Function()? onPermissionDenied}) async {
    Logger.debug('克风权限 开始请求🚀🚀🚀 > > >', tag: _tag);

    final firstStatus = await Permission.microphone.status;
    Logger.debug('麦克风权限 授权状态📱📱📱: ${firstStatus.name}', tag: _tag);

    if (firstStatus.isGranted) {
      Logger.info('麦克风权限 查询状态 > > > 已授权完整权限✅✅✅', tag: _tag);
    } else if (firstStatus.isDenied) {
      Logger.error('麦克风权限 查询状态 > > > 权限被拒绝❌❌❌ 发起重新申请 > > >', tag: _tag);
      final requestStatus =
          await PermissionManager.instance._enqueue(Permission.microphone);

      if (requestStatus.isPermanentlyDenied || requestStatus.isDenied) {
        Logger.error('麦克风权限 申请状态 > > > 被拒绝❌❌❌', tag: _tag);
        onPermissionDenied?.call();
      }
      return requestStatus.isGranted;
    } else if (firstStatus.isPermanentlyDenied) {
      Logger.error('麦克风权限 查询状态 > > > 被拒绝❌❌❌', tag: _tag);
      onPermissionDenied?.call();
    }

    return firstStatus.isGranted;
  }

  // 申请通知权限
  Future<bool> requestNotificationPermission(
      {Function()? onPermissionDenied}) async {
    Logger.debug('通知权限 开始请求🚀🚀🚀 > > >', tag: _tag);

    final firstStatus = await Permission.notification.status;
    Logger.debug('通知权限 授权状态📱📱📱: ${firstStatus.name}', tag: _tag);

    if (firstStatus.isGranted) {
      Logger.info('通知权限 查询状态 > > > 已授权完整权限✅✅✅', tag: _tag);
    } else if (firstStatus.isDenied) {
      Logger.error('通知权限 查询状态 > > > 权限被拒绝❌❌❌ 发起重新申请 > > >', tag: _tag);
      final requestStatus =
          await PermissionManager.instance._enqueue(Permission.microphone);

      if (requestStatus.isPermanentlyDenied || requestStatus.isDenied) {
        Logger.error('通知权限 申请状态 > > > 被拒绝❌❌❌', tag: _tag);
        onPermissionDenied?.call();
      }
      return requestStatus.isGranted;
    } else if (firstStatus.isPermanentlyDenied) {
      Logger.error('通知权限 查询状态 > > > 被拒绝❌❌❌', tag: _tag);
      onPermissionDenied?.call();
    }

    return firstStatus.isGranted;
  }

  ///申请广告权限
  Future<bool> requestAppTrackPermission() async {
    if (Platform.isIOS) {
      Logger.debug('AppTracking权限 开始请求🚀🚀🚀 > > >', tag: _tag);

      final firstStatus = await Permission.appTrackingTransparency.status;
      Logger.debug('AppTracking权限 授权状态📱📱📱: ${firstStatus.name}', tag: _tag);

      if (firstStatus.isGranted) {
        Logger.info('AppTracking权限 查询状态 > > > 已授权完整权限✅✅✅', tag: _tag);
        return true;
      } else if (firstStatus.isDenied) {
        Logger.error('AppTracking权限 查询状态 > > > 权限被拒绝❌❌❌ 发起重新申请 > > >',
            tag: _tag);
        final requestStatus =
            await Permission.appTrackingTransparency.request();

        if (requestStatus.isPermanentlyDenied || requestStatus.isDenied) {
          Logger.error('AppTracking权限 申请状态 > > > 被拒绝❌❌❌', tag: _tag);
          return false;
        }
        return requestStatus.isGranted;
      } else if (firstStatus.isPermanentlyDenied) {
        Logger.error('AppTracking权限 查询状态 > > > 被拒绝❌❌❌', tag: _tag);
        return false;
      }

      return firstStatus.isGranted;
    } else {
      return true;
    }
  }
}
