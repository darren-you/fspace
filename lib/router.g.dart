// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $appProtocolRoute,
      $mainRoute,
      $loginPageRoute,
      $userProfileRoute,
      $settingRoute,
      $tesRoute,
      $photoPreviewRoute,
      $photoPreviewMultiRoute,
      $photoCropRoute,
      $systemPermissionPageRoute,
    ];

RouteBase get $appProtocolRoute => GoRouteData.$route(
      path: '/appprotocol',
      factory: $AppProtocolRoute._fromState,
    );

mixin $AppProtocolRoute on GoRouteData {
  static AppProtocolRoute _fromState(GoRouterState state) =>
      const AppProtocolRoute();

  @override
  String get location => GoRouteData.$location(
        '/appprotocol',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainRoute => GoRouteData.$route(
      path: '/home/:tab',
      factory: $MainRoute._fromState,
    );

mixin $MainRoute on GoRouteData {
  static MainRoute _fromState(GoRouterState state) => MainRoute(
        tab: state.pathParameters['tab']!,
      );

  MainRoute get _self => this as MainRoute;

  @override
  String get location => GoRouteData.$location(
        '/home/${Uri.encodeComponent(_self.tab)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginPageRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginPageRoute._fromState,
    );

mixin $LoginPageRoute on GoRouteData {
  static LoginPageRoute _fromState(GoRouterState state) =>
      const LoginPageRoute();

  @override
  String get location => GoRouteData.$location(
        '/login',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userProfileRoute => GoRouteData.$route(
      path: '/profile',
      factory: $UserProfileRoute._fromState,
    );

mixin $UserProfileRoute on GoRouteData {
  static UserProfileRoute _fromState(GoRouterState state) =>
      const UserProfileRoute();

  @override
  String get location => GoRouteData.$location(
        '/profile',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingRoute => GoRouteData.$route(
      path: '/setting',
      factory: $SettingRoute._fromState,
    );

mixin $SettingRoute on GoRouteData {
  static SettingRoute _fromState(GoRouterState state) => const SettingRoute();

  @override
  String get location => GoRouteData.$location(
        '/setting',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $tesRoute => GoRouteData.$route(
      path: '/test',
      factory: $TesRoute._fromState,
    );

mixin $TesRoute on GoRouteData {
  static TesRoute _fromState(GoRouterState state) => const TesRoute();

  @override
  String get location => GoRouteData.$location(
        '/test',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $photoPreviewRoute => GoRouteData.$route(
      path: '/photo-preview',
      factory: $PhotoPreviewRoute._fromState,
    );

mixin $PhotoPreviewRoute on GoRouteData {
  static PhotoPreviewRoute _fromState(GoRouterState state) => PhotoPreviewRoute(
        forceCut: _$convertMapValue(
                'force-cut', state.uri.queryParameters, _$boolConverter) ??
            false,
        cropX: _$convertMapValue(
            'crop-x', state.uri.queryParameters, int.tryParse),
        cropY: _$convertMapValue(
            'crop-y', state.uri.queryParameters, int.tryParse),
        $extra: state.extra as Map<String, dynamic>?,
      );

  PhotoPreviewRoute get _self => this as PhotoPreviewRoute;

  @override
  String get location => GoRouteData.$location(
        '/photo-preview',
        queryParams: {
          if (_self.forceCut != false) 'force-cut': _self.forceCut.toString(),
          if (_self.cropX != null) 'crop-x': _self.cropX!.toString(),
          if (_self.cropY != null) 'crop-y': _self.cropY!.toString(),
        },
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}

RouteBase get $photoPreviewMultiRoute => GoRouteData.$route(
      path: '/photo-preview-multi',
      factory: $PhotoPreviewMultiRoute._fromState,
    );

mixin $PhotoPreviewMultiRoute on GoRouteData {
  static PhotoPreviewMultiRoute _fromState(GoRouterState state) =>
      PhotoPreviewMultiRoute(
        minSelectCount: _$convertMapValue(
                'min-select-count', state.uri.queryParameters, int.parse) ??
            1,
        maxSelectCount: _$convertMapValue(
                'max-select-count', state.uri.queryParameters, int.parse) ??
            1,
        $extra: state.extra as Map<String, dynamic>?,
      );

  PhotoPreviewMultiRoute get _self => this as PhotoPreviewMultiRoute;

  @override
  String get location => GoRouteData.$location(
        '/photo-preview-multi',
        queryParams: {
          if (_self.minSelectCount != 1)
            'min-select-count': _self.minSelectCount.toString(),
          if (_self.maxSelectCount != 1)
            'max-select-count': _self.maxSelectCount.toString(),
        },
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $photoCropRoute => GoRouteData.$route(
      path: '/photo-crop',
      factory: $PhotoCropRoute._fromState,
    );

mixin $PhotoCropRoute on GoRouteData {
  static PhotoCropRoute _fromState(GoRouterState state) => PhotoCropRoute(
        cropX: _$convertMapValue(
            'crop-x', state.uri.queryParameters, int.tryParse),
        cropY: _$convertMapValue(
            'crop-y', state.uri.queryParameters, int.tryParse),
        path: state.uri.queryParameters['path']!,
        $extra: state.extra as Map<String, dynamic>?,
      );

  PhotoCropRoute get _self => this as PhotoCropRoute;

  @override
  String get location => GoRouteData.$location(
        '/photo-crop',
        queryParams: {
          if (_self.cropX != null) 'crop-x': _self.cropX!.toString(),
          if (_self.cropY != null) 'crop-y': _self.cropY!.toString(),
          'path': _self.path,
        },
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

RouteBase get $systemPermissionPageRoute => GoRouteData.$route(
      path: '/system-permission',
      factory: $SystemPermissionPageRoute._fromState,
    );

mixin $SystemPermissionPageRoute on GoRouteData {
  static SystemPermissionPageRoute _fromState(GoRouterState state) =>
      SystemPermissionPageRoute();

  @override
  String get location => GoRouteData.$location(
        '/system-permission',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
