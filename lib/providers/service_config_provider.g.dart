// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 写真钻石消耗

@ProviderFor(makePhtotSpeed)
const makePhtotSpeedProvider = MakePhtotSpeedProvider._();

/// 写真钻石消耗

final class MakePhtotSpeedProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  /// 写真钻石消耗
  const MakePhtotSpeedProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'makePhtotSpeedProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$makePhtotSpeedHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return makePhtotSpeed(ref);
  }
}

String _$makePhtotSpeedHash() => r'17bd92327e09058d1ccf1547310fa5f862db045f';

/// 获取页面通用配置

@ProviderFor(commonConfig)
const commonConfigProvider = CommonConfigProvider._();

/// 获取页面通用配置

final class CommonConfigProvider extends $FunctionalProvider<
        AsyncValue<AppConfigModel?>, AppConfigModel?, FutureOr<AppConfigModel?>>
    with $FutureModifier<AppConfigModel?>, $FutureProvider<AppConfigModel?> {
  /// 获取页面通用配置
  const CommonConfigProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'commonConfigProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$commonConfigHash();

  @$internal
  @override
  $FutureProviderElement<AppConfigModel?> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AppConfigModel?> create(Ref ref) {
    return commonConfig(ref);
  }
}

String _$commonConfigHash() => r'83a51c0a6c0186dbdded2e1a277595465ac6cc52';
