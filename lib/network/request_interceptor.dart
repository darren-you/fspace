import 'package:fspace/app.dart';
import 'package:fspace/constants/prefrences_keys.dart';
import 'package:fspace/enums/custom_exception_type.dart';
import 'package:fspace/eventbus/event_bus.dart';
import 'package:fspace/generated/l10n/l10n.dart';
import 'package:fspace/managers/app_config_manager.dart';
import 'package:fspace/managers/preferences_manager.dart';
import 'package:fspace/models/app_info_model.dart';
import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';

/// 请求拦截器
///
/// 1、设置公共请求参数到Header
/// 2、设置请求验证码的签名
/// 3、设置用户的本地登陆Token
class RequestInterceptor extends Interceptor {
  final AppInfoModel appInfo;

  RequestInterceptor({required this.appInfo});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> publicParams = {};
    publicParams["version"] = appInfo.appVersion;
    publicParams["channel"] = AppConfigManager.instance.channel;
    publicParams["deviceId"] = appInfo.deviceId;

    // 将公共参数添加到请求头中
    // 避免重复添加
    publicParams.forEach((k, v) {
      if (options.headers[k] == null) {
        options.headers[k] = v;
      }
    });

    // 设置请求验证码的签名
    // 区分调试模式
    if (options.path == '/api/user/login/send_code' &&
        options.method == "POST") {
      String secretKey = "d3j7k1h9a5b2e4m6q8r0l7n9p4z2t";
      if (kDebugMode) {
        secretKey = "a9x7b2d4e6f8g3h5k9j2l8m6n5o4p3q";
      }
      String originalString =
          "phone=${options.data["phone"]}&secret_key=$secretKey&timestamp=${options.data["timestamp"]}";
      var bytes = utf8.encode(originalString); // 将字符串转换为UTF-8编码的字节列表
      var digest = md5.convert(bytes); // 计算MD5哈希值
      String md5Hash = digest.toString(); // 将哈希值转换为字符串形式（可选）
      options.data["signature"] = md5Hash;
    }

    // 设置用户本地登陆令牌
    final authToken =
        PreferencesManager.instance.getString(PreferencesKeys.userLoginToken);
    if (authToken != null) {
      options.headers['X-Token'] = authToken;
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 处理响应为空的情况
    if (response.data == null) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          message: t.common.httpServiceError,
          response: response,
        ),
        true,
      );
      return;
    }

    // 处理响应数据结构错误的情况
    if (response.data is! Map<String, dynamic>) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          message: t.common.httpServiceError,
          response: response,
        ),
        true,
      );
      return;
    }

    /// 业务数据为空
    // if (response.data['code'] == 200 && response.data['data'] == null) {
    //   handler.reject(
    //     DioException(
    //       requestOptions: response.requestOptions,
    //       message: '业务数据为空',
    //       response: response,
    //     ),
    //     true,
    //   );
    //   return;
    // }

    if (response.data["code"] == 200) {
      handler.next(response); // 继续传递响应
    } else {
      // 特殊处理 401 未授权错误
      if (response.data["code"] == 401) {
        // 发送 Token 过期事件
        getIt<EventBus>().fire(UserTokenExpired());
      }

      // 其他情况这转换为DioException
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: CustomExceptionType.business,
          message: response.data['msg'],
        ),
        true,
      );
    }
  }
}
