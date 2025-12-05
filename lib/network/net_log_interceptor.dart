import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fspace/utils/logger_util.dart';

/// 日志打印拦截器，仅在调试模式下输出
/// 使用 'NET' 作为标签，方便过滤
class NetLogInterceptor extends Interceptor {
  bool isShowLog = kDebugMode;
  // bool isShowLog = false;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (isShowLog) {
      var log = '*** Request ***';
      log += '\n${_printKV('uri', options.uri)}';
      log += '\n${_printKV('method', options.method)}';
      log += '\n${_printKV('responseType', options.responseType.toString())}';
      log += '\n${_printKV('followRedirects', options.followRedirects)}';
      log +=
          '\n${_printKV('persistentConnection', options.persistentConnection)}';
      log += '\n${_printKV('connectTimeout', options.connectTimeout)}';
      log += '\n${_printKV('sendTimeout', options.sendTimeout)}';
      log += '\n${_printKV('receiveTimeout', options.receiveTimeout)}';
      log +=
          '\n${_printKV('receiveDataWhenStatusError', options.receiveDataWhenStatusError)}';
      log += '\n${_printKV('extra', options.extra)}';
      log += '\nheaders:';
      options.headers.forEach((key, v) {
        log += '\n${_printKV(' $key', v)}';
      });
      log += '\ndata:';
      log += '\n${_formatRequestData(options.data)}';

      // 添加cURL命令
      log += '\n\ncURL Command:';
      log += '\n${_getCurlCommand(options)}';

      _logPrint(log);
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (isShowLog) {
      var log = '*** Response ***';
      log += _printResponse(response);
      _logPrint(log);
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (isShowLog) {
      var log = '*** DioException ***:';
      log += '\nmethod: ${err.requestOptions.method}';
      log += '\nDioExceptionType: ${err.type}';
      log += '\nerror: ${err.error}';
      if (err.response != null) {
        log += _printResponse(err.response!);
      }
      _logPrint(log);
    }
    handler.next(err);
  }

  String _printResponse(Response response) {
    var log = '';
    log += '\n${_printKV('uri', response.requestOptions.uri)}';
    log += '\n${_printKV('statusCode', response.statusCode)}';
    if (response.isRedirect == true) {
      log += '\n${_printKV('redirect', response.realUri)}';
    }
    log += '\nheaders:';
    response.headers.forEach((key, v) {
      log += '\n${_printKV(' $key', v.join('\r\n\t'))}';
    });
    log += '\nResponse Text:';
    log += '\n${response.toString()}';
    return log;
  }

  String _printKV(String key, Object? v) {
    return '$key: $v';
  }

  void _logPrint(String m) {
    Logger.verbose(m);
  }

  /// 格式化请求数据，安全处理不同类型的数据
  String _formatRequestData(dynamic data) {
    if (data == null) {
      return 'null';
    }

    try {
      // 处理FormData类型
      if (data is FormData) {
        var result = 'FormData:\n';

        // 显示字段
        if (data.fields.isNotEmpty) {
          result += '  Fields:\n';
          for (var field in data.fields) {
            result += '    ${field.key}: ${field.value}\n';
          }
        }

        // 显示文件
        if (data.files.isNotEmpty) {
          result += '  Files:\n';
          for (var file in data.files) {
            result +=
                '    ${file.key}: ${file.value.filename ?? 'unknown'} (${file.value.length} bytes)\n';
          }
        }

        return result;
      }

      // 处理其他可JSON序列化的数据
      return jsonEncode(data).toString();
    } catch (e) {
      // 如果无法序列化，返回类型和字符串表示
      return 'Type: ${data.runtimeType}, Value: ${data.toString()}';
    }
  }

  /// 生成cURL命令
  /// 将Dio的RequestOptions转换为等效的cURL命令
  /// 支持不同的请求方法、headers、请求体类型（JSON、FormData等）
  /// 并处理超时、重定向等选项
  String _getCurlCommand(RequestOptions options) {
    var command = ['curl'];

    // 添加请求方法，除非是GET（curl默认为GET）
    if (options.method != 'GET') {
      command.add('-X ${options.method}');
    }

    // 添加URL
    command.add('"${options.uri.toString()}"');

    // 添加headers
    options.headers.forEach((key, value) {
      // 跳过content-length，因为curl会自动计算
      // 跳过host，因为curl会从URL中提取
      if (key.toLowerCase() != 'content-length' &&
          key.toLowerCase() != 'host') {
        // 确保值是字符串
        String headerValue = value.toString();
        // 转义双引号
        headerValue = headerValue.replaceAll('"', '\\"');
        command.add('-H "$key: $headerValue"');
      }
    });

    // 添加请求体
    if (options.data != null) {
      var data = options.data;

      // 处理FormData类型
      if (data is FormData) {
        // 对于FormData，我们需要添加multipart/form-data的Content-Type
        if (!options.headers.containsKey('content-type')) {
          command.add('-H "Content-Type: multipart/form-data"');
        }

        // 添加FormData字段
        for (var field in data.fields) {
          command.add('-F "${field.key}=${field.value}"');
        }

        // 添加FormData文件
        for (var file in data.files) {
          command.add('-F "${file.key}=@${file.value.filename}"');
        }
      }
      // 处理JSON数据
      else if (data is Map || data is List) {
        // 对于JSON数据，如果没有指定Content-Type，添加application/json
        if (!options.headers.containsKey('content-type')) {
          command.add('-H "Content-Type: application/json"');
        }
        command.add('-d "${jsonEncode(data).replaceAll('"', '\\"')}"');
      }
      // 处理字符串数据
      else if (data is String) {
        command.add('-d "${data.replaceAll('"', '\\"')}"');
      }
    }

    // 添加--compressed标志，如果接受压缩响应
    if (options.headers.containsKey('accept-encoding') &&
        options.headers['accept-encoding'].toString().contains('gzip')) {
      command.add('--compressed');
    }

    // 处理重定向
    if (options.followRedirects) {
      command.add('-L');
    }

    // 处理超时
    if (options.connectTimeout != null &&
        options.connectTimeout!.inMilliseconds > 0) {
      command.add('--connect-timeout ${options.connectTimeout!.inSeconds}');
    }

    if (options.receiveTimeout != null &&
        options.receiveTimeout!.inMilliseconds > 0) {
      command.add('--max-time ${options.receiveTimeout!.inSeconds}');
    }

    // 添加-v (verbose)选项，以便查看详细信息
    command.add('-v');

    // 使用空格连接命令，不使用换行符和反斜杠，避免字符串转义问题
    return command.join(' ');
  }
}
