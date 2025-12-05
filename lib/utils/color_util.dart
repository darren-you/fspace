import 'dart:math';
import 'package:flutter/material.dart';

class ColorUtils {
  ColorUtils._();

  /// 生成随机颜色
  static Color randomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255, // 不透明度固定为255
      random.nextInt(256), // 红色分量 0-255
      random.nextInt(256), // 绿色分量 0-255
      random.nextInt(256), // 蓝色分量 0-255
    );
  }

  /// 生成随机颜色（带透明度）
  static Color randomColorWithAlpha() {
    final Random random = Random();
    return Color.fromARGB(
      random.nextInt(256), // 透明度 0-255
      random.nextInt(256), // 红色分量 0-255
      random.nextInt(256), // 绿色分量 0-255
      random.nextInt(256), // 蓝色分量 0-255
    );
  }

  /// 生成随机亮色（适合作为背景色）
  static Color randomLightColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      128 + random.nextInt(128), // 红色分量 128-255
      128 + random.nextInt(128), // 绿色分量 128-255
      128 + random.nextInt(128), // 蓝色分量 128-255
    );
  }

  /// 生成随机深色（适合作为文字色）
  static Color randomDarkColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(128), // 红色分量 0-127
      random.nextInt(128), // 绿色分量 0-127
      random.nextInt(128), // 蓝色分量 0-127
    );
  }
}
