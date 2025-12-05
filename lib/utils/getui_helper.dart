import 'package:flutter/services.dart';
import 'package:fspace/utils/logger_util.dart';

final String _tag = 'GetuiHelper';

/// 个推推送参数处理工具类
class GetuiHelper {
  static const MethodChannel _channel =
      MethodChannel('com.calendar.chongli/getui');

  /// 推送参数回调函数类型
  static Function(Map<String, dynamic>)? _onPushParamsCallback;

  /// 初始化个推助手
  static Future<void> initialize() async {
    try {
      // 设置方法调用处理器，监听来自原生端的推送参数
      _channel.setMethodCallHandler(_handleMethodCall);
      Logger.info('GetuiHelper 初始化成功', tag: _tag);
    } catch (e) {
      Logger.error('GetuiHelper 初始化失败: $e', tag: _tag);
    }
  }

  /// 处理来自原生端的方法调用
  static Future<dynamic> _handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'onPushParams':
        final params = Map<String, dynamic>.from(call.arguments);
        Logger.info('收到推送参数: $params', tag: _tag);

        // 调用回调函数
        if (_onPushParamsCallback != null) {
          _onPushParamsCallback!(params);
        }

        return true;
      default:
        Logger.info('未知方法调用: ${call.method}', tag: _tag);
        return false;
    }
  }

  /// 主动获取推送参数
  static Future<Map<String, dynamic>?> getPushParams() async {
    try {
      final result = await _channel.invokeMethod('getPushParams');
      if (result != null) {
        final params = Map<String, dynamic>.from(result);
        Logger.info('主动获取推送参数: $params', tag: _tag);
        return params;
      }
      return null;
    } catch (e) {
      Logger.info('获取推送参数失败: $e', tag: _tag);
      return null;
    }
  }

  /// 设置推送参数回调函数
  static void setOnPushParamsCallback(Function(Map<String, dynamic>) callback) {
    _onPushParamsCallback = callback;
  }

  /// 移除推送参数回调函数
  static void removeOnPushParamsCallback() {
    _onPushParamsCallback = null;
  }

  /// 从推送参数中提取work-id
  static String? getWorkId(Map<String, dynamic>? params) {
    if (params == null) return null;
    return params['work-id'] ?? params['workId'];
  }

  /// 从推送参数中提取title
  static String? getTitle(Map<String, dynamic>? params) {
    if (params == null) return null;
    return params['title'];
  }

  /// 检查推送参数是否包含必要的字段
  static bool hasRequiredParams(Map<String, dynamic>? params) {
    if (params == null) return false;
    final workId = getWorkId(params);
    final title = getTitle(params);
    return workId != null &&
        workId.isNotEmpty &&
        title != null &&
        title.isNotEmpty;
  }
}
