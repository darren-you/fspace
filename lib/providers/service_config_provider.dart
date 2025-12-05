import 'package:fspace/app.dart';
import 'package:fspace/models/app_config_model.dart';
import 'package:fspace/network/api_client.dart';

import 'package:fspace/utils/logger_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_config_provider.g.dart';

/// 写真钻石消耗
@riverpod
FutureOr<String> makePhtotSpeed(Ref ref) async {
  try {
    final data = await getIt<ApiClient>()
        .getAppConfig()
        .then((value) => value.data as Map);
    return data['make_photo'] as String? ?? '10';
  } catch (e) {
    Logger.error('Config配置读取 -> 写真钻石消耗 error: $e ');
    return '10';
  }
}

/// 获取页面通用配置
@riverpod
FutureOr<AppConfigModel?> commonConfig(Ref ref) async {
  try {
    final data = (await getIt<ApiClient>().getAppConfig()).data;
    return data;
  } catch (e) {
    Logger.error('Config配置读取 -> 页面通用配置 error: $e ');
    return null;
  }
}
