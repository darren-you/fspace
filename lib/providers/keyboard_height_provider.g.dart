// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyboard_height_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(KeyboardHeightNotifier)
const keyboardHeightProvider = KeyboardHeightNotifierProvider._();

final class KeyboardHeightNotifierProvider
    extends $NotifierProvider<KeyboardHeightNotifier, double> {
  const KeyboardHeightNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'keyboardHeightProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$keyboardHeightNotifierHash();

  @$internal
  @override
  KeyboardHeightNotifier create() => KeyboardHeightNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$keyboardHeightNotifierHash() =>
    r'532eb6ec5f3de98e36c6122669632ce009538367';

abstract class _$KeyboardHeightNotifier extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<double, double>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<double, double>, double, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
