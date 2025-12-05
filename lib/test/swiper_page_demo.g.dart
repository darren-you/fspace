// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swiper_page_demo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SwiperNotifier)
const swiperProvider = SwiperNotifierProvider._();

final class SwiperNotifierProvider
    extends $NotifierProvider<SwiperNotifier, SwiperState> {
  const SwiperNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'swiperProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$swiperNotifierHash();

  @$internal
  @override
  SwiperNotifier create() => SwiperNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SwiperState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SwiperState>(value),
    );
  }
}

String _$swiperNotifierHash() => r'5183b7fedd698be34184eb5c0269b0628689ab6b';

abstract class _$SwiperNotifier extends $Notifier<SwiperState> {
  SwiperState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SwiperState, SwiperState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<SwiperState, SwiperState>, SwiperState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AnimationControllers)
const animationControllersProvider = AnimationControllersProvider._();

final class AnimationControllersProvider extends $NotifierProvider<
    AnimationControllers, Map<String, AnimationController>> {
  const AnimationControllersProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'animationControllersProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$animationControllersHash();

  @$internal
  @override
  AnimationControllers create() => AnimationControllers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, AnimationController> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<Map<String, AnimationController>>(value),
    );
  }
}

String _$animationControllersHash() =>
    r'279490303098d25db9b1eb37659f047fb5e0714c';

abstract class _$AnimationControllers
    extends $Notifier<Map<String, AnimationController>> {
  Map<String, AnimationController> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Map<String, AnimationController>,
        Map<String, AnimationController>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<Map<String, AnimationController>,
            Map<String, AnimationController>>,
        Map<String, AnimationController>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
