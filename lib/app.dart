import 'dart:io';

import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fspace/constants/app_define.dart';
import 'package:fspace/constants/prefrences_keys.dart';
import 'package:fspace/generated/l10n/l10n.dart';
import 'package:fspace/managers/app_config_manager.dart';
import 'package:fspace/managers/app_info_manager.dart';
import 'package:fspace/managers/launch_manager.dart';
import 'package:fspace/managers/preferences_manager.dart';
import 'package:fspace/network/net_log_interceptor.dart';
import 'package:fspace/network/request_interceptor.dart';
import 'package:fspace/utils/logger_util.dart';
import 'package:get_it/get_it.dart';
import 'package:http_proxy/http_proxy.dart';

import 'network/api_client.dart';

export 'generated/assets.gen.dart';

final _logTag = 'AppInit';

/// get_it 依赖注入框架初始化
final getIt = GetIt.instance;

/// 初始化基础框架
///
/// 1、Flutter从屏幕边缘开始绘制
/// 2、SharePreference初始化
/// 3、网络代理初始化
/// 4、EventBus单例依赖注入
Future<void> initBase() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await PreferencesManager.instance.init();

  // 让网络能够使用系统代理
  HttpProxy httpProxy = await HttpProxy.createHttpProxy();
  HttpOverrides.global = httpProxy;

  // EventBus初始化
  getIt.registerSingleton<EventBus>(EventBus());

  // AppConfig信息
  AppConfigManager.instance.init();

  // 使用设备系统语言
  LocaleSettings.useDeviceLocale();
  Logger.info('initBase✅ 初始化基础框架完成 time: ${DateTime.now()}', tag: _logTag);
}

/// 初始化App框架，同意协议后
///
/// 1、首次启动时间（仅一次初始化）
/// 2、获取包信息
/// 3、设备信息
/// 4、Dio初始化
/// 5、各类管理Manager初始化
/// 6、三方SDK初始化
Future<void> initApp() async {
  final agreedProtocol =
      PreferencesManager.instance.getBool(PreferencesKeys.agreedAppProtocol) ??
          false;
  if (!agreedProtocol) {
    Logger.info('未同意App协议⚠️ time: ${DateTime.now()}', tag: _logTag);
    return;
  }

  // 获取App信息
  await AppInfoManager.instance.init();
  final appInfo = AppInfoManager.instance.appInfoModel;

  // 初始化Dio
  final apiClient = ApiClient(
    Dio(BaseOptions(validateStatus: (_) => true))
      ..interceptors.add(RequestInterceptor(appInfo: appInfo!))
      ..interceptors.add(NetLogInterceptor()),
    baseUrl: kDebugMode ? kTestBaseURL : kBaseURL,
  );

  // 单例注入
  getIt.registerSingleton<ApiClient>(apiClient);

  // 设置首次启动时间
  LaunchManager.instance.initializeFirstLaunchTime();

  Logger.info('initApp✅ App基础环境初始化完成time: ${DateTime.now()}', tag: _logTag);

  return;
}
