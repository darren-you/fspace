import 'package:fspace/constants/app_define.dart';
import 'package:thinking_analytics/td_analytics.dart';
import 'package:fspace/utils/logger_util.dart';

final String _logTag = 'ThinkingAnalyticsManager';

/// 数数统计
class ThinkingAnalyticsManager {
  ThinkingAnalyticsManager._();

  /// 初始化SDK
  static void init() {
    try {
      TDAnalytics.enableLog(true);
      TDConfig config = TDConfig();
      config.appId = kThinkingAnalyticsAppID;
      config.serverUrl = kThinkingAnalyticsServiceURL;
      config.setMode(isProduct ? TDMode.NORMAL : TDMode.DEBUG);
      TDAnalytics.initWithConfig(config);
      TDAnalytics.enableAutoTrack(
        TDAutoTrackEventType.APP_START |
            TDAutoTrackEventType.APP_END |
            TDAutoTrackEventType.APP_INSTALL |
            TDAutoTrackEventType.APP_CRASH |
            TDAutoTrackEventType.APP_CLICK |
            TDAutoTrackEventType.APP_VIEW_SCREEN,
      );
      Logger.info('初始化成功', tag: _logTag);
    } catch (e) {
      Logger.error('初始化失败: $e', tag: _logTag);
    }
  }

  /// 设置公共属性
  static void setSuperProperties(Map<String, dynamic> properties,
      {String? appId}) {
    TDAnalytics.setSuperProperties(properties, appId: appId);

    Logger.info('设置公共属性, parameters: $properties', tag: _logTag);
  }

  /// 设置用户属性
  static void setUsrProperties(Map<String, dynamic> parameters, String? appId) {
    TDAnalytics.userSet(parameters, appId: appId);

    Logger.info('设置用户属性, parameters: $parameters', tag: _logTag);
  }

  /// 上报事件
  static void logEvent(
    String eventName, {
    Map<String, dynamic>? properties,
    DateTime? dateTime,
    String? timeZone,
    String? appId,
  }) {
    try {
      TDAnalytics.track(
        eventName,
        properties: properties,
        dateTime: dateTime,
        timeZone: timeZone,
        appId: appId,
      );
    } on Exception catch (e) {
      Logger.debug('上报错误 error: $e', tag: _logTag);
    }
  }
}
