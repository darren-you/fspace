import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fspace/constants/firebase_options.dart';
import 'package:fspace/utils/logger_util.dart';

final String _logTag = 'FirebaseAnalyticsManager';

/// Firebase统计
class FirebaseAnalyticsManager {
  FirebaseAnalyticsManager._();
  static late FirebaseAnalytics? _firebaseAnalytics;

  /// 初始化 & 开启统计
  static void init() async {
    try {
      // 初始化SDK
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      _firebaseAnalytics = FirebaseAnalytics.instance;

      // 开启统计
      await _firebaseAnalytics!.setAnalyticsCollectionEnabled(true);
      Logger.info('初始化成功', tag: _logTag);
    } catch (e) {
      Logger.error('初始化失败: $e', tag: _logTag);
    }
  }

  static void logEvent({
    required String name,
    Map<String, Object>? parameters,
    AnalyticsCallOptions? callOptions,
  }) {
    try {
      _firebaseAnalytics?.logEvent(
        name: name,
        parameters: parameters,
        callOptions: callOptions,
      );
    } on Exception catch (e) {
      Logger.debug('上报错误 error: $e', tag: _logTag);
    }
  }
}
