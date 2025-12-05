import 'package:fspace/constants/prefrences_keys.dart';
import 'package:fspace/managers/preferences_manager.dart';

final String _tag = 'LaunchManager';

class LaunchManager {
  LaunchManager._();

  static LaunchManager? _instance;

  static LaunchManager get instance {
    _instance ??= LaunchManager._();
    return _instance!;
  }

  /// 初始化App首次启动时间
  void initializeFirstLaunchTime() {
    final firstLaunchTime =
        PreferencesManager.instance.getString(PreferencesKeys.firstLaunchTime);
    if (firstLaunchTime == null || firstLaunchTime.isEmpty) {
      PreferencesManager.instance
          .setString(PreferencesKeys.firstLaunchTime, '${DateTime.now()}');
    }
  }

  /// 是否为首次启动
  bool isFirstLaunch() {
    final firstLaunchTime =
        PreferencesManager.instance.getString(PreferencesKeys.firstLaunchTime);
    if (firstLaunchTime == null || firstLaunchTime.isEmpty) {
      return true;
    }
    return false;
  }

  /// 首次启动时间
  String? getFirstLaunchTime() {
    return PreferencesManager.instance
        .getString(PreferencesKeys.firstLaunchTime);
  }

  /// 重置首次启动时间
  void resetFirstLaunchTime() {
    PreferencesManager.instance
        .setString(PreferencesKeys.firstLaunchTime, null);
  }

  /// 更新App启动时间
  void updateLaunchTimestamp() {
    final currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    PreferencesManager.instance
        .setInt(PreferencesKeys.lastLaunchDate, currentTimestamp);
  }

  /// 上次App启动时间
  DateTime get lastLaunchTimestamp {
    final lastLaunchTimestamp =
        PreferencesManager.instance.getInt(PreferencesKeys.lastLaunchDate) ?? 0;

    return DateTime.fromMillisecondsSinceEpoch(lastLaunchTimestamp);
  }

  /// 是否为今日首次启动
  bool isFirstLaunchToday() {
    final DateTime lastLaunch = lastLaunchTimestamp;
    final nowLaunch = DateTime.now();

    bool isDifferentDay = lastLaunch.year != nowLaunch.year ||
        lastLaunch.month != nowLaunch.month ||
        lastLaunch.day != nowLaunch.day;

    updateLaunchTimestamp();

    return isDifferentDay;
  }
}
