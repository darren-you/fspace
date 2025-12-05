import 'package:fspace/constants/prefrences_keys.dart';
import 'package:fspace/managers/preferences_manager.dart';

class ProtocolManager {
  ProtocolManager._();

  static ProtocolManager? _instance;

  static ProtocolManager get instance {
    _instance ??= ProtocolManager._();
    return _instance!;
  }

  /// 获取同意App使用协议状态
  bool agreedAppProtocolStatus() {
    final agreedAppProtocolStatus =
        PreferencesManager.instance.getBool(PreferencesKeys.agreedAppProtocol);
    if (agreedAppProtocolStatus == null || !agreedAppProtocolStatus) {
      return false;
    }
    return true;
  }

  /// 设置同意App使用协议
  void setAgreedAppProtocol() {
    PreferencesManager.instance
        .setBool(PreferencesKeys.agreedAppProtocol, true);
  }

  /// 清空同意App使用协议状态
  void removeAgreedAppProtocol() {
    PreferencesManager.instance
        .setBool(PreferencesKeys.agreedAppProtocol, null);
  }
}
