import 'dart:io';

final String _tag = 'AppConfigManager';

/// App配置信息
class AppConfigManager {
  static const String tag = 'AppConfigManager';

  static AppConfigManager? _instance;

  AppConfigManager._();

  static AppConfigManager get instance {
    _instance ??= AppConfigManager._();
    return _instance!;
  }

  String _channel = 'Youloft_Android_official';

  void init() {
    const channel = String.fromEnvironment('CHANNEL', defaultValue: 'official');
    if (Platform.isAndroid) {
      _channel = 'Youloft_Android_$channel';
    }
    if (Platform.isIOS) {
      _channel = 'Youloft_IOS';
    }
  }

  String get channel {
    return _channel;
  }
}
