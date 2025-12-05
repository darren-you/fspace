// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppUser)
const appUserProvider = AppUserProvider._();

final class AppUserProvider extends $NotifierProvider<AppUser, UserInfoModel?> {
  const AppUserProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appUserProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appUserHash();

  @$internal
  @override
  AppUser create() => AppUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserInfoModel? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserInfoModel?>(value),
    );
  }
}

String _$appUserHash() => r'a17489b56b214fa611a97d1c69d509c6ce227a9f';

abstract class _$AppUser extends $Notifier<UserInfoModel?> {
  UserInfoModel? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserInfoModel?, UserInfoModel?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<UserInfoModel?, UserInfoModel?>,
        UserInfoModel?,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}

/// 是否登录

@ProviderFor(isLogged)
const isLoggedProvider = IsLoggedProvider._();

/// 是否登录

final class IsLoggedProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 是否登录
  const IsLoggedProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'isLoggedProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$isLoggedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isLogged(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isLoggedHash() => r'869c5fa06db84ec1d6713b74223c9fcb585c3489';
