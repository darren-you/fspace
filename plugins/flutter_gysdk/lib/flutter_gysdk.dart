export 'src/messages.g.dart';

import 'src/messages.g.dart';

class FlutterGYSdk {
  static final _api = GYSdkApi();

  static Future<void> init({required String appId}) {
    return _api.initSDK(appId);
  }

  static Future<PreLoginInfo> preLogin({int timeout = 5}) {
    return _api.preLogin(timeout);
  }

  static Future<bool> isPreLoginResultValid() {
    return _api.isPreLoginResultValid();
  }

  static Future<LoginInfo> login({int timeout = 5}) {
    return _api.login(timeout);
  }
}

extension PreLoginInfoExt on PreLoginInfo {
  String get operatorName {
    /// CM, CU, CT 安卓
    /// 1, 2, 3 iOS
    return switch (operatorType) {
      'CM' => '移动',
      'CU' => '联通',
      'CT' => '电信',
      '1' => '移动',
      '2' => '联通',
      '3' => '电信',
      _ => '',
    };
  }
}
