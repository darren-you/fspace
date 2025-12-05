import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fspace/utils/logger_util.dart';

/// 屏幕适配工具类
/// 基于设计稿尺寸进行屏幕适配
class ScreenUtils {
  static ScreenUtils? _instance;
  static ScreenUtils get instance {
    _instance ??= ScreenUtils._();
    return _instance!;
  }

  ScreenUtils._();

  final _logTag = 'ScreenUtils';

  /// 设计稿宽度
  late double _designWidth;

  /// 设计稿高度
  late double _designHeight;

  /// 屏幕宽度
  late double _screenWidth;

  /// 屏幕高度
  late double _screenHeight;

  /// 宽度缩放比例
  late double _scaleWidth;

  /// 高度缩放比例
  late double _scaleHeight;

  /// 屏幕StatusBar高度
  late double _statusBarHeight;

  /// 屏幕底部安全区域高度
  late double _bottomBarHeight;

  /// 初始化屏幕适配
  /// [designWidth] 设计稿宽度
  /// [designHeight] 设计稿高度
  void init({
    required BuildContext context,
    required double designWidth,
    required double designHeight,
  }) {
    _designWidth = designWidth;
    _designHeight = designHeight;

    final view = PlatformDispatcher.instance.views.first;
    final size = view.physicalSize / view.devicePixelRatio;

    _screenWidth = size.width;
    _screenHeight = size.height;

    _scaleWidth = _screenWidth / _designWidth;
    _scaleHeight = _screenHeight / _designHeight;

    _statusBarHeight = MediaQuery.of(context).padding.top;

    _bottomBarHeight = MediaQuery.of(context).padding.bottom;

    Logger.warning(
        'statusBarHeight: $_statusBarHeight, bottomBarHeight: $_bottomBarHeight',
        tag: _logTag);
  }

  /// 根据设计稿宽度适配
  double w(double width) {
    return width * _scaleWidth;
  }

  /// 根据设计稿高度适配
  double h(double height) {
    return height * _scaleHeight;
  }

  /// 根据较小的缩放比例适配（保持比例）
  double r(double size) {
    final scale = _scaleWidth < _scaleHeight ? _scaleWidth : _scaleHeight;
    return size * scale;
  }

  /// 根据设计稿字体大小适配
  double sp(double fontSize) {
    return fontSize * _scaleWidth;
  }

  /// 屏幕宽度适配
  double get screenWidth => _screenWidth;

  /// 屏幕高度适配
  double get screenHeight => _screenHeight;

  /// 获取设计稿宽度
  double get designWidth => _designWidth;

  /// 获取设计稿高度
  double get designHeight => _designHeight;

  /// 获取宽度缩放比例
  double get scaleWidth => _scaleWidth;

  /// 获取高度缩放比例
  double get scaleHeight => _scaleHeight;

  /// 状态栏高度
  double get statusBarHeight => _statusBarHeight;

  /// 底部导航栏高度
  double get bottomBarHeight => _bottomBarHeight;

  /// 底部导航栏高度 最小值 20
  double get bottomBarMinHeight => _bottomBarHeight > 0 ? _bottomBarHeight : 20;

  /// 根据设计稿宽度计算比例，固定值不参与适配
  double getScaleWidth({double fixedValue = 0}) {
    return (_screenWidth - fixedValue) / (_designWidth - fixedValue);
  }
}

/// 全局扩展方法，方便使用
extension ScreenUtilsExtension on num {
  /// 根据设计稿宽度适配
  double get w => ScreenUtils.instance.w(toDouble());

  /// 根据设计稿高度适配
  double get h => ScreenUtils.instance.h(toDouble());

  /// 根据较小的缩放比例适配（保持比例）
  double get r => ScreenUtils.instance.r(toDouble());

  /// 根据设计稿字体大小适配
  double get sp => ScreenUtils.instance.sp(toDouble());
}
