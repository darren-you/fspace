import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fspace/managers/permission_manager.dart';
import 'package:fspace/managers/protocol_manager.dart';
import 'package:fspace/modules/album/photo_crop_page.dart';
import 'package:fspace/modules/album/photo_preview_multi_page.dart';
import 'package:fspace/modules/album/photo_preview_page.dart';
import 'package:fspace/modules/home/ui/home_page.dart';
import 'package:fspace/modules/login/login.dart';
import 'package:fspace/modules/setting/ui/setting_page.dart';
import 'package:fspace/modules/test/test.dart';
import 'package:fspace/project/pages/system_permission_page.dart';
import 'package:fspace/providers/app_user_provider.dart';
import 'package:fspace/utils/logger_util.dart';
import 'package:go_router/go_router.dart';
import 'package:fspace/modules/protocols/ui/app_protocol_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'modules/user_profile/ui/user_profile_page.dart';

part 'router.g.dart';

final String _tag = 'Router';

/// 自定义路由观察者
final routeObserver = RouteObserver<PageRoute>();

/// App首次使用隐私协议重定向
String? _firstUseRedirect() {
  if (!ProtocolManager.instance.agreedAppProtocolStatus()) {
    return AppProtocolRoute().location;
  }
  return null;
}

/// 未登陆重定向
String? _loginRedirect() {
  if (!ProviderContainer().read(isLoggedProvider)) {
    return LoginPageRoute().location;
  }
  return null;
}

// 相册未授权重定向
Future<String?> _albumPermissionRejectRedirect() async {
  final albumPermissionState = await PermissionManager.checkPhotoPermission();
  Logger.warning(
      '相册权限 重定向 拥有相册权限: $albumPermissionState 是否重定向: ${!albumPermissionState}',
      tag: _tag);
  if (!albumPermissionState) {
    return SystemPermissionPageRoute().location;
  }
  return null;
}

/// App隐私协议
@TypedGoRoute<AppProtocolRoute>(path: '/appprotocol')
class AppProtocolRoute extends GoRouteData with $AppProtocolRoute {
  const AppProtocolRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const CupertinoPage(child: AppProtocolPage());
  }
}

/// 首页
@TypedGoRoute<MainRoute>(
  path: '/home/:tab',
)
class MainRoute extends GoRouteData with $MainRoute {
  const MainRoute({required this.tab});

  final String tab;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CupertinoPage(
      child: HomePage(
        initialTab: HomePageTab.fromString(tab),
      ),
    );
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return _firstUseRedirect();
  }
}

/// 账号密码登录页
@TypedGoRoute<LoginPageRoute>(path: '/login')
class LoginPageRoute extends GoRouteData with $LoginPageRoute {
  const LoginPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const CupertinoPage(
      child: LoginPage(),
      fullscreenDialog: true,
    );
  }
}

/// 用户资料页
@TypedGoRoute<UserProfileRoute>(path: '/profile')
class UserProfileRoute extends GoRouteData with $UserProfileRoute {
  const UserProfileRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const CupertinoPage(
      child: UserProfilePage(),
    );
  }

  // 页面重定向函数
  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (!ProviderContainer().read(isLoggedProvider)) {
      log('用户未登陆 -> 去登陆');
      return LoginPageRoute().location;
    }
    return null;
  }
}

/// 设置页
@TypedGoRoute<SettingRoute>(path: '/setting')
class SettingRoute extends GoRouteData with $SettingRoute {
  const SettingRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const CupertinoPage(
      child: SettingPage(),
    );
  }
}

/// 测试界面
@TypedGoRoute<TesRoute>(path: '/test')
class TesRoute extends GoRouteData with $TesRoute {
  const TesRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const CupertinoPage(
      child: TestPage(),
    );
  }
}

/// 相册预览页-单图
@TypedGoRoute<PhotoPreviewRoute>(path: '/photo-preview')
class PhotoPreviewRoute extends GoRouteData with $PhotoPreviewRoute {
  final bool forceCut;
  final int? cropX;
  final int? cropY;
  final Map<String, dynamic>? $extra;
  const PhotoPreviewRoute(
      {this.$extra, this.forceCut = false, this.cropX, this.cropY});
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CupertinoPage(
      child: PhotoPreviewPage(
        forceCut: forceCut,
        cropX: cropX,
        cropY: cropY,
        onSelect: $extra?['onSelect'],
      ),
    );
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return _albumPermissionRejectRedirect();
  }
}

/// 相册预览页-多图
@TypedGoRoute<PhotoPreviewMultiRoute>(path: '/photo-preview-multi')
class PhotoPreviewMultiRoute extends GoRouteData with $PhotoPreviewMultiRoute {
  /// 最小选择数量
  final int minSelectCount;

  /// 最大选择数量
  final int maxSelectCount;

  /// 额外参数
  final Map<String, dynamic>? $extra;

  const PhotoPreviewMultiRoute(
      {this.$extra, this.minSelectCount = 1, this.maxSelectCount = 1});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CupertinoPage(
      child: PhotoPreviewMultiPage(
        minSelectCount: minSelectCount,
        maxSelectCount: maxSelectCount,
        selectedAssets: $extra?['selectedAssets'],
        onSelect: $extra?['onSelect'],
      ),
    );
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return _albumPermissionRejectRedirect();
  }
}

/// 图片裁剪
@TypedGoRoute<PhotoCropRoute>(path: '/photo-crop')
class PhotoCropRoute extends GoRouteData with $PhotoCropRoute {
  final String path;
  final int? cropX;
  final int? cropY;
  final Map<String, dynamic>? $extra;
  const PhotoCropRoute(
      {this.$extra, this.cropX, this.cropY, required this.path});
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CupertinoPage(
      child: PhotoCropPage(
        path: path,
        cropX: cropX,
        cropY: cropY,
        onSelect: $extra?['onSelect'],
      ),
    );
  }

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    return _albumPermissionRejectRedirect();
  }
}

/// 系统权限settings
@TypedGoRoute<SystemPermissionPageRoute>(path: '/system-permission')
class SystemPermissionPageRoute extends GoRouteData
    with $SystemPermissionPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CupertinoPage(
      child: SystemPermissionPage(),
    );
  }
}
