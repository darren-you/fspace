import 'dart:convert';

import 'package:event_bus/event_bus.dart';
import 'package:fspace/app.dart';
import 'package:fspace/constants/prefrences_keys.dart';
import 'package:fspace/eventbus/event_bus.dart';
import 'package:fspace/managers/preferences_manager.dart';
import 'package:fspace/models/user_info_model.dart';
import 'package:fspace/network/api_client.dart';
import 'package:fspace/utils/logger_util.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_user_provider.g.dart';

final String _tag = 'AppUserProvider';

/// 从本地缓存中读取用户登陆信息
/// 将 JSON 数据解析为 UserInfoModel 对象
UserInfoModel? getUser() {
  final cacheUserInfoData =
      PreferencesManager.instance.getString(PreferencesKeys.userCacheInfo);
  if (cacheUserInfoData != null) {
    try {
      final jsonObj = jsonDecode(cacheUserInfoData);
      if (jsonObj is Map) {
        return UserInfoModel.fromJson(Map<String, dynamic>.from(jsonObj));
      }
    } catch (e) {
      Logger.error('获取用户失败:$e time: ${DateTime.now()}', tag: _tag);
    }
  }
  return null;
}

@Riverpod(keepAlive: true)
class AppUser extends _$AppUser {
  @override
  UserInfoModel? build() {
    // 监听 token 过期事件
    final sub = getIt<EventBus>().on<UserTokenExpired>().listen((_) {
      delete();
    });

    // 在销毁时取消事件订阅
    ref.onDispose(() {
      sub.cancel();
    });

    // 返回本地缓存的用户信息
    return getUser();
  }

  Future<void> refresh() async {
    if (state == null) return;
    try {
      var userInfoModel = (await getIt<ApiClient>().getCurrentUserInfo()).data!;
      save(userInfoModel);
      getIt<EventBus>().fire(UserUpdatedEvent());
    } catch (e) {
      Logger.error('刷新用户信息错误:$e time: ${DateTime.now()}', tag: _tag);
    }
  }

  void save(UserInfoModel? newValue, {String? accessToken}) {
    PreferencesManager.instance
        .setString(PreferencesKeys.userLoginToken, accessToken);
    PreferencesManager.instance.setString(PreferencesKeys.userCacheInfo,
        newValue == null ? null : jsonEncode(newValue.toJson()));

    final oldValue = state;
    state = newValue;
    if (oldValue != null && newValue == null) {
      getIt<EventBus>().fire(UserLogoutEvent());
    } else if (oldValue == null && newValue != null) {
      getIt<EventBus>().fire(UserLoginedEvent());
    }
  }

  /// 删除用户信息方法
  void delete() {
    save(null);
  }
}

/// 是否登录
@Riverpod(keepAlive: true)
bool isLogged(Ref ref) {
  return ref.watch(appUserProvider) != null;
}
