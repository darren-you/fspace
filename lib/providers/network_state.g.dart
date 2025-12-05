// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 设置网络连接状态

@ProviderFor(NetworkState)
const networkStateProvider = NetworkStateProvider._();

/// 设置网络连接状态
final class NetworkStateProvider
    extends $NotifierProvider<NetworkState, NetworkStatus> {
  /// 设置网络连接状态
  const NetworkStateProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'networkStateProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$networkStateHash();

  @$internal
  @override
  NetworkState create() => NetworkState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkStatus>(value),
    );
  }
}

String _$networkStateHash() => r'8546145f29caf494fab7268ffc20f6c18c290bfc';

/// 设置网络连接状态

abstract class _$NetworkState extends $Notifier<NetworkStatus> {
  NetworkStatus build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<NetworkStatus, NetworkStatus>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<NetworkStatus, NetworkStatus>,
        NetworkStatus,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
