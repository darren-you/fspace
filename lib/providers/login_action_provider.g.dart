// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_action_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginAction)
const loginActionProvider = LoginActionProvider._();

final class LoginActionProvider extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  const LoginActionProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loginActionProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loginActionHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return loginAction(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$loginActionHash() => r'bbd22051296ac5cb08d896e5d9d62ccaccfee89a';
