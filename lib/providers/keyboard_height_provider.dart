import 'package:flutter/widgets.dart';
import 'package:fspace/utils/logger_util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'keyboard_height_provider.g.dart';

final String _tag = 'KeyboardObserver';

/// 键盘高度监听器
class _KeyboardObserver extends WidgetsBindingObserver {
  final void Function(double height) onKeyboardHeightChanged;

  _KeyboardObserver(this.onKeyboardHeightChanged);

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding
        .instance.platformDispatcher.views.first.viewInsets.bottom;
    onKeyboardHeightChanged(bottomInset);
  }
}

@Riverpod(keepAlive: true)
class KeyboardHeightNotifier extends _$KeyboardHeightNotifier {
  _KeyboardObserver? _observer;
  double _currentHeight = 0.0;

  @override
  double build() {
    // 初始化键盘监听器
    _observer = _KeyboardObserver((height) {
      Logger.debug('KeyboardObserver height: $height', tag: _tag);
      if (_currentHeight != height) {
        _currentHeight = height;
        state = height;
      }
    });

    WidgetsBinding.instance.addObserver(_observer!);

    // 监听provider销毁，清理资源
    ref.onDispose(() {
      if (_observer != null) {
        WidgetsBinding.instance.removeObserver(_observer!);
        _observer = null;
      }
    });

    return _currentHeight;
  }

  /// 获取当前键盘高度
  double getCurrentHeight() => state;

  /// 判断键盘是否显示
  bool isKeyboardVisible() => state > 0;

  /// 判断键盘是否隐藏
  bool isKeyboardHidden() => state == 0;
}
