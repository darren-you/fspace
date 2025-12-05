import 'package:fspace/utils/logger_util.dart';

import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:fspace/constants/app_define.dart';

final String _logTag = 'AppsflyerAnalyticsManager';

class AppsflyerAnalyticsManager {
  AppsflyerAnalyticsManager._();
  static Map? installConversionData;
  static AppsflyerSdk? _appsFlayerSdk;

  static Future<void> init() async {
    try {
      final appsFlayerOptions = AppsFlyerOptions(
        afDevKey: kAppsFlyerDevKey,
        appId: kAppsFlyerAppID,
        timeToWaitForATTUserAuthorization: 60,
        manualStart: true,
        showDebug: kDebugMode,
      );
      final appsFlayerSdk = AppsflyerSdk(appsFlayerOptions);
      await appsFlayerSdk.initSdk(
        registerConversionDataCallback: true,
        registerOnAppOpenAttributionCallback: true,
        registerOnDeepLinkingCallback: true,
      );

      // Conversion data callback
      appsFlayerSdk.onInstallConversionData((res) {
        if (res is Map) {
          installConversionData = res;
        }
        Logger.info("onInstallConversionData res: $res", tag: _logTag);
      });

      // App open attribution callback
      appsFlayerSdk.onAppOpenAttribution((res) {
        Logger.info("onAppOpenAttribution res: $res", tag: _logTag);
      });

      // Deep linking callback
      appsFlayerSdk.onDeepLinking((DeepLinkResult dp) {
        switch (dp.status) {
          case Status.FOUND:
            Logger.info(dp.deepLink?.toString() ?? "", tag: _logTag);
            Logger.info("deep link value: ${dp.deepLink?.deepLinkValue}",
                tag: _logTag);
            break;
          case Status.NOT_FOUND:
            Logger.info("deep link not found", tag: _logTag);
            break;
          case Status.ERROR:
            Logger.info("deep link error: ${dp.error}", tag: _logTag);
            break;
          case Status.PARSE_ERROR:
            Logger.info("deep link status parsing error", tag: _logTag);
            break;
        }
        Logger.info("onDeepLinking res: $dp", tag: _logTag);
      });

      appsFlayerSdk.startSDK(
        onSuccess: () {
          _appsFlayerSdk = appsFlayerSdk;
          Logger.info("AppsFlyer SDK initialized successfully.", tag: _logTag);
        },
        onError: (int errorCode, String errorMessage) {
          Logger.info(
              "AppsFlyer SDK initialization failed. Error code: $errorCode, Error message: $errorMessage",
              tag: _logTag);
        },
      );
    } catch (e) {
      Logger.debug(e.toString(), tag: _logTag);
    }
  }

  static void logEvent(String eventName, Map<dynamic, dynamic>? eventValues) {
    try {
      _appsFlayerSdk?.logEvent(eventName, eventValues);
    } on Exception catch (e) {
      Logger.debug('上报错误 error: $e', tag: _logTag);
    }
  }
}
