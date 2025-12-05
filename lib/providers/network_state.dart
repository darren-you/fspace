import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network_state.g.dart';

enum NetworkStatus { connected, disconnected }

/// 设置网络连接状态
@Riverpod(keepAlive: true)
class NetworkState extends _$NetworkState {
  StreamSubscription? _subscription;

  @override
  NetworkStatus build() {
    _initNetworkListener();
    return NetworkStatus.connected;
  }

  void _initNetworkListener() {
    _subscription = Connectivity().onConnectivityChanged.listen((results) {
      // 只要不是 none，就认为是已连接状态
      state = results.contains(ConnectivityResult.none)
          ? NetworkStatus.disconnected
          : NetworkStatus.connected;
    });

    // 立即检查当前网络状态
    Connectivity().checkConnectivity().then((results) {
      state = results.contains(ConnectivityResult.none)
          ? NetworkStatus.disconnected
          : NetworkStatus.connected;
    });

    ref.onDispose(() {
      _subscription?.cancel();
    });
  }
}
