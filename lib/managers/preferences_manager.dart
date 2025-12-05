import 'package:fspace/utils/logger_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String _tag = 'PreferencesManager';

/// 本地轻量存储
/// 基于shared_preferences
class PreferencesManager {
  PreferencesManager._();

  static PreferencesManager? _instance;

  static PreferencesManager get instance {
    _instance ??= PreferencesManager._();
    return _instance!;
  }

  bool _init = false;
  late SharedPreferences prefs;

  bool _initCheck() {
    if (!_init) {
      Logger.warning('LocalStorageManager 未初始化⚠️', tag: _tag);
    }
    return _init;
  }

  /// 初始化
  Future<void> init() async {
    if (_initCheck()) {
      Logger.info('LocalStorageManager 已初始化', tag: _tag);
      return;
    }
    try {
      prefs = await SharedPreferences.getInstance();
      _init = true;
      Logger.info('LocalStorageManager 初始化完成✅.', tag: _tag);
    } catch (e) {
      Logger.error('LocalStorageManager 初始化错误❌: $e', tag: _tag);
    }
  }

  String? getString(String key) {
    if (!_initCheck()) {
      return null;
    }
    return prefs.getString(key);
  }

  /// value为null则remove
  Future<bool> setString(String key, String? value) async {
    if (!_initCheck()) {
      return false;
    }
    if (value != null) {
      return await prefs.setString(key, value);
    } else {
      return await prefs.remove(key);
    }
  }

  int? getInt(String key) {
    if (!_initCheck()) {
      return null;
    }
    return prefs.getInt(key);
  }

  /// value为null则remove
  void setInt(String key, int? value) {
    if (!_initCheck()) {
      return;
    }
    if (value != null) {
      prefs.setInt(key, value);
    } else {
      prefs.remove(key);
    }
  }

  bool? getBool(String key) {
    if (!_initCheck()) {
      return null;
    }
    return prefs.getBool(key);
  }

  /// value为null则remove
  void setBool(String key, bool? value) {
    if (!_initCheck()) {
      return;
    }
    if (value != null) {
      prefs.setBool(key, value);
    } else {
      prefs.remove(key);
    }
  }

  List<String>? getStringList(String key) {
    if (!_initCheck()) {
      return null;
    }
    return prefs.getStringList(key);
  }

  /// value为null则remove
  Future<bool> setStringList(String key, List<String>? value) async {
    if (!_initCheck()) {
      return false;
    }
    if (value != null) {
      return await prefs.setStringList(key, value);
    } else {
      return await prefs.remove(key);
    }
  }
}
