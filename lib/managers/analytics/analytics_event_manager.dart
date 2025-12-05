import 'dart:io';

import 'package:fspace/managers/analytics/thinking_analytics_manager.dart';
import 'package:fspace/providers/app_user_provider.dart';

import 'appsflyer_analytics_manager.dart';

final String _logTag = 'AnalyticsEventManager';

class AnalyticsEventManager {
  AnalyticsEventManager._();

  static Map<String, dynamic> _baseParams({
    bool iReportUser = true,
    bool isReportRegist = false,
  }) {
    final result = <String, dynamic>{};
    result["channel"] = Platform.isIOS ? "App Store" : "Google Play";
    if (AppsflyerAnalyticsManager.installConversionData != null) {
      final adChannel = AppsflyerAnalyticsManager
          .installConversionData?["payload"]["media_source"];
      if (adChannel != null) {
        result["ad_channel"] = adChannel;
      }
    }

    final user = getUser();
    if (user != null) {
      final registTime = DateTime.fromMillisecondsSinceEpoch(user.registAt);
      if (iReportUser) {
        if (DateTime.now().difference(registTime).inDays > 1) {
          result['user'] = "老用户";
        } else {
          result['user'] = "新用户";
        }
      }
      if (isReportRegist) {
        if (DateTime.now().difference(registTime).inSeconds <= 3) {
          result['first_login'] = true;
        } else {
          result['first_login'] = false;
        }
      }
      result['user_id'] = user.id;
      result['diamond'] = user.diamond;
    }
    return result;
  }

  //用户登录 - 登录成功时
  static void loginEvent() {
    try {
      final param = _baseParams(isReportRegist: true, iReportUser: false);
      ThinkingAnalyticsManager.logEvent("login", properties: param);
    } catch (_) {}
  }

  //模版浏览 - 点击模版进入详情时
  static void templateBrowseEvent({required int templateId}) {
    try {
      final param = _baseParams(iReportUser: false);
      param['template_id'] = templateId;
      ThinkingAnalyticsManager.logEvent("template_browse", properties: param);
    } catch (_) {}
  }

  //模版制作 - 点击模版制作时
  static void templateMakeEvent({required int templateId}) {
    try {
      final param = _baseParams(iReportUser: false);
      param['template_id'] = templateId;
      ThinkingAnalyticsManager.logEvent("template_make", properties: param);
    } catch (_) {}
  }

  //模版充值 - 点击模版充值Vip时
  static void templateBuyVipEvent({int? templateId}) {
    try {
      final param = _baseParams(iReportUser: false);
      if (templateId != null) {
        param['template_id'] = templateId;
      }
      ThinkingAnalyticsManager.logEvent("template_vip", properties: param);
    } catch (_) {}
  }

  //进入会员支付 - 进入支付页面时
  static void memberEnterEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("member_enter", properties: param);
    } catch (_) {}
  }

  //点击会员支付 - 点击支付按钮时
  static void memberBuyEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("member_buy", properties: param);
    } catch (_) {}
  }

  //会员支付成功 - 支付成功时
  static void memberBuySuccessEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("member_buy_success",
          properties: param);
    } catch (_) {}
  }

  //进入钻石支付 - 进入钻石页面时
  static void diamondEnterEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("diamond_enter", properties: param);
    } catch (_) {}
  }

  //点击钻石支付 - 点击支付按钮时
  static void diamondBuyEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("diamond_buy", properties: param);
    } catch (_) {}
  }

  //钻石支付成功 - 支付成功时
  static void diamondBuySuccessEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("diamond_buy_success",
          properties: param);
    } catch (_) {}
  }

  //图片生成 - 点击图片生成入口时
  static void imageGenerationEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("image_generation", properties: param);
    } catch (_) {}
  }

  //图片完成 - 点击图片生成按钮时
  static void imageGenerationDoneEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("image_generation_done",
          properties: param);
    } catch (_) {}
  }

  //视频生成 - 点击视频生成入口时
  static void videoGenerationEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("video_generation", properties: param);
    } catch (_) {}
  }

  //视频完成 - 点击视频生成按钮时
  static void videoGenerationDoneEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("video_generation_done",
          properties: param);
    } catch (_) {}
  }

  // 对口型 - 点击对口型入口时
  static void lipSyncEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("lip_sync", properties: param);
    } catch (_) {}
  }

  // 对口型完成 - 点击对口型生成按钮时
  static void lipSyncDoneEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("lip_sync_done", properties: param);
    } catch (_) {}
  }

  // AI跳舞 - 点击AI跳舞入口时
  static void aiDanceEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("ai_dance", properties: param);
    } catch (_) {}
  }

  //AI跳舞完成 - 点击AI跳舞生成按钮时
  static void aiDanceDoneEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("ai_dance_done", properties: param);
    } catch (_) {}
  }

  // 文本生成视频 - 点击文本生成视频入口时
  static void textToVideoEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("text_to_video", properties: param);
    } catch (_) {}
  }

  //文本生成视频完成 - 点击文本生成视频生成按钮时
  static void textToVideoDoneEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("text_to_video_done",
          properties: param);
    } catch (_) {}
  }

  // 再次生成 - 作品详情页点击再次生成时
  static void regenerateEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("regenerate", properties: param);
    } catch (_) {}
  }

  // 重新编辑 - 作品详情页点击重新编辑时
  static void reEditEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("re_edit", properties: param);
    } catch (_) {}
  }

  // 生成视频 - 作品详情页点击生成视频时
  static void generateVideoEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("generate_video", properties: param);
    } catch (_) {}
  }

  // 图片修改 - 作品详情页点击图片修改时
  static void imageModificationEvent() {
    try {
      final param = _baseParams();
      ThinkingAnalyticsManager.logEvent("image_modification",
          properties: param);
    } catch (_) {}
  }

  // 发起订单 - 用户发起充值订单
  static void orderInit({
    required String orderId,
    required String payType,
    required num payAmount,
    required String payReason,
    required bool isFirstPay,
  }) {
    try {
      final param = _baseParams();
      param.addAll({
        "order_id": orderId,
        "pay_type": payType,
        "pay_amount": payAmount,
        "pay_reason": payReason,
        "is_first_pay": isFirstPay,
      });
      ThinkingAnalyticsManager.logEvent("order_init", properties: param);
    } catch (_) {}
  }
}
