import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:fspace/utils/logger_util.dart';

final String _logTag = 'FacebookAnalyticsManager';

/// FaceBook统计
class FacebookAnalyticsManager {
  FacebookAnalyticsManager._();
  static FacebookAppEvents? _facebookAppEvents;

  /// 初始化SDK
  static void init() async {
    try {
      _facebookAppEvents = FacebookAppEvents();
      Logger.info('初始化成功', tag: _logTag);
    } catch (e) {
      Logger.error('初始化失败: $e', tag: _logTag);
    }
  }

  static void logEvent({
    required String name,
    Map<String, dynamic>? parameters,
    double? valueToSum,
  }) {
    try {
      _facebookAppEvents?.logEvent(
        name: name,
        parameters: parameters,
        valueToSum: valueToSum,
      );
    } on Exception catch (e) {
      Logger.debug('上报错误 error: $e', tag: _logTag);
    }
  }
}
