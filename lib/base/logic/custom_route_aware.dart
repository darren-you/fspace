import 'package:flutter/widgets.dart';

/// 路由可见性监听器：用于在当前页面被其他页面覆盖/恢复
class CustomRouteAware implements RouteAware {
  CustomRouteAware({this.onPushNext, this.onPopNext, this.onPop, this.onPush});

  final VoidCallback? onPushNext;
  final VoidCallback? onPopNext;
  final VoidCallback? onPop;
  final VoidCallback? onPush;

  @override
  void didPushNext() {
    onPushNext?.call();
  }

  @override
  void didPopNext() {
    onPopNext?.call();
  }

  @override
  void didPop() {
    onPop?.call();
  }

  @override
  void didPush() {
    onPush?.call();
  }
}
