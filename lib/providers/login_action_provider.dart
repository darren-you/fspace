import 'package:event_bus/event_bus.dart';
import 'package:fspace/app.dart';
import 'package:fspace/eventbus/event_bus.dart';
import 'package:fspace/utils/logger_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_action_provider.g.dart';

final String _tag = 'loginActionProvider';

@Riverpod(keepAlive: true)
void loginAction(Ref ref) {
  // 用户登陆
  getIt<EventBus>().on<UserLoginedEvent>().listen((onData) {
    Logger.info('EventBus -> 用户登陆', tag: _tag);
    _userLogined(ref);
  });

  // 用户退出
  getIt<EventBus>().on<UserLogoutEvent>().listen((onData) {
    Logger.info('EventBus -> 用户退出', tag: _tag);
    _userLogout(ref);
  });
  return;
}

/// 用户登陆后的逻辑
///
/// ...
Future<void> _userLogined(Ref ref) async {}

/// 用户退出后的逻辑
///
/// ...
Future<void> _userLogout(Ref ref) async {}
