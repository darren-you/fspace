import 'package:fspace/models/base_getui_message.dart';

/// 登录账号
class UserLoginedEvent {}

/// 退出账号
class UserLogoutEvent {}

/// 用户信息更新
class UserUpdatedEvent {}

/// 用户token过期
class UserTokenExpired {}

/// 个推静默消息
class GeTuiRecMessageData {
  final BaseGetuiMessage<Map<String, Object?>> baseGetuiMessage;
  final bool isApns;

  GeTuiRecMessageData({required this.baseGetuiMessage, this.isApns = false});
}
