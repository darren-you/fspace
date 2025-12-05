import 'dart:developer' as developer;

/// 基于dart:developer封装的日志工具类
/// 解决控制台单行输出过长被截断的问题，并支持彩色输出
class Logger {
  // 控制是否启用日志输出
  static bool enable = true;

  // 定义ANSI颜色代码[1,8](@ref)
  static const String _reset = '\x1B[0m';
  // ignore: unused_field
  static const String _black = '\x1B[30m';
  static const String _red = '\x1B[31m';
  // ignore: unused_field
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _magenta = '\x1B[35m';
  static const String _cyan = '\x1B[36m';
  static const String _white = '\x1B[37m';

  // 日志级别颜色映射
  static const Map<LogLevel, String> _levelColors = {
    LogLevel.verbose: _white,
    LogLevel.debug: _blue,
    LogLevel.info: _cyan,
    LogLevel.warning: _yellow,
    LogLevel.error: _red,
    LogLevel.wtf: _magenta,
  };

  // 日志级别文本映射
  static const Map<LogLevel, String> _levelTexts = {
    LogLevel.verbose: 'VERBOSE',
    LogLevel.debug: 'DEBUG',
    LogLevel.info: 'INFO',
    LogLevel.warning: 'WARNING',
    LogLevel.error: 'ERROR',
    LogLevel.wtf: 'WTF',
  };

  /// 详细日志（白色）
  static void verbose(String message, {String? tag}) {
    _log(LogLevel.verbose, message, tag: tag);
  }

  /// 调试日志（蓝色）
  static void debug(String message, {String? tag}) {
    _log(LogLevel.debug, message, tag: tag);
  }

  /// 信息日志（青色）
  static void info(String message, {String? tag}) {
    _log(LogLevel.info, message, tag: tag);
  }

  /// 警告日志（黄色）
  static void warning(String message,
      {String? tag, dynamic error, StackTrace? stackTrace}) {
    _log(LogLevel.warning, message,
        tag: tag, error: error, stackTrace: stackTrace);
  }

  /// 错误日志（红色）
  static void error(String message,
      {String? tag, dynamic error, StackTrace? stackTrace}) {
    _log(LogLevel.error, message,
        tag: tag, error: error, stackTrace: stackTrace);
  }

  /// 严重错误日志（品红色）
  static void wtf(String message,
      {String? tag, dynamic error, StackTrace? stackTrace}) {
    _log(LogLevel.wtf, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  /// 统一的日志处理方法
  static void _log(
    LogLevel level,
    String message, {
    String? tag,
    dynamic error,
    StackTrace? stackTrace,
  }) {
    if (!enable) return;

    final timestamp = DateTime.now().toIso8601String();
    final levelColor = _levelColors[level] ?? _white;
    final levelText = _levelTexts[level] ?? 'UNKNOWN';

    // 构建基础日志信息
    final tagPrefix = tag != null ? '[$tag] ' : '';
    final baseMessage = '$timestamp $levelText: $tagPrefix$message';

    // 添加颜色[1](@ref)
    final coloredMessage = '$levelColor$baseMessage$_reset';

    // 使用developer.log而不是print，避免截断问题[2](@ref)
    // 将错误和堆栈信息作为单独参数传递
    developer.log(
      coloredMessage,
      name: tag ?? 'Logger',
      time: DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
  }
}

/// 日志级别枚举
enum LogLevel {
  verbose,
  debug,
  info,
  warning,
  error,
  wtf,
}
