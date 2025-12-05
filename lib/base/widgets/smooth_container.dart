import 'package:figma_squircle_updated/figma_squircle.dart';
import 'package:flutter/material.dart';

/// 平滑矩形裁剪器
class SmoothRectangleClipper extends CustomClipper<Path> {
  final SmoothBorderRadius borderRadius;

  const SmoothRectangleClipper({
    required this.borderRadius,
  });

  @override
  Path getClip(Size size) {
    return SmoothRectangleBorder(
      borderRadius: borderRadius,
    ).getOuterPath(Offset.zero & size);
  }

  @override
  bool shouldReclip(SmoothRectangleClipper oldClipper) {
    return borderRadius != oldClipper.borderRadius;
  }
}

/// 平滑圆角容器组件，专门用于实现iOS风格的平滑圆角效果
/// 最佳实践：
/// - cornerSmoothing建议值：0.6-0.8可获得接近iOS的效果
/// - 对于小圆角（<8px），建议使用较小的cornerSmoothing值
/// - 对于大圆角（>16px），可以使用较大的cornerSmoothing值获得更好的视觉效果
class SmoothContainer extends StatelessWidget {
  /// 子组件
  final Widget? child;

  /// 背景颜色
  final Color? color;

  /// 外边距
  final EdgeInsetsGeometry? margin;

  /// 内边距
  final EdgeInsetsGeometry? padding;

  /// 圆角半径
  final BorderRadiusGeometry? borderRadius;

  /// 边框
  final BoxBorder? border;

  /// 边框宽度
  final double? borderWidth;

  /// 边框颜色
  final Color? borderColor;

  /// 边框样式
  final BorderStyle? borderStyle;

  /// 阴影
  final List<BoxShadow>? boxShadow;

  /// 渐变
  final Gradient? gradient;

  /// 宽度
  final double? width;

  /// 高度
  final double? height;

  /// 裁剪行为
  final Clip clipBehavior;

  /// 圆角平滑程度 (0.0-1.0)，0.0为普通圆角，1.0为最平滑的iOS风格圆角
  final double cornerSmoothing;

  /// 对齐方式
  final AlignmentGeometry? alignment;

  /// 变换
  final Matrix4? transform;

  /// 变换对齐
  final AlignmentGeometry? transformAlignment;

  const SmoothContainer({
    super.key,
    this.child,
    this.color,
    this.margin,
    this.padding,
    this.borderRadius,
    this.border,
    this.borderWidth,
    this.borderColor,
    this.borderStyle,
    this.boxShadow,
    this.gradient,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
    this.cornerSmoothing = 0.6,
    this.alignment,
    this.transform,
    this.transformAlignment,
  }) : assert(cornerSmoothing >= 0.0 && cornerSmoothing <= 1.0,
            'cornerSmoothing must be between 0.0 and 1.0');

  /// 将BorderRadiusGeometry转换为SmoothBorderRadius
  SmoothBorderRadius? _convertToSmoothBorderRadius(
      BorderRadiusGeometry? borderRadius) {
    if (borderRadius == null) return null;

    if (borderRadius is BorderRadius) {
      // 获取各个角的半径值
      final topLeft = borderRadius.topLeft.x;
      final topRight = borderRadius.topRight.x;
      final bottomLeft = borderRadius.bottomLeft.x;
      final bottomRight = borderRadius.bottomRight.x;

      // 如果所有角都相同，使用简化构造函数
      if (topLeft == topRight &&
          topRight == bottomLeft &&
          bottomLeft == bottomRight) {
        return SmoothBorderRadius(
          cornerRadius: topLeft,
          cornerSmoothing: cornerSmoothing,
        );
      }

      // 否则使用only构造函数
      return SmoothBorderRadius.only(
        topLeft: SmoothRadius(
          cornerRadius: topLeft,
          cornerSmoothing: cornerSmoothing,
        ),
        topRight: SmoothRadius(
          cornerRadius: topRight,
          cornerSmoothing: cornerSmoothing,
        ),
        bottomLeft: SmoothRadius(
          cornerRadius: bottomLeft,
          cornerSmoothing: cornerSmoothing,
        ),
        bottomRight: SmoothRadius(
          cornerRadius: bottomRight,
          cornerSmoothing: cornerSmoothing,
        ),
      );
    }

    return null;
  }

  /// 构建边框
  BoxBorder? _buildBorder() {
    // 优先使用新的border参数
    if (borderWidth != null || borderColor != null || borderStyle != null) {
      return Border.all(
        width: borderWidth ?? 1.0,
        color: borderColor ?? const Color(0xFF000000),
        style: borderStyle ?? BorderStyle.solid,
      );
    }
    // 回退到原有的border参数
    return border;
  }

  /// 构建BorderSide（用于平滑圆角）
  BorderSide _buildBorderSide() {
    // 优先使用新的border参数
    if (borderWidth != null || borderColor != null || borderStyle != null) {
      return BorderSide(
        width: borderWidth ?? 1.0,
        color: borderColor ?? const Color(0xFF000000),
        style: borderStyle ?? BorderStyle.solid,
      );
    }

    // 回退到原有的border参数
    if (border is Border) {
      final borderObj = border as Border;
      // 检查是否所有边都相同（通常由Border.all创建）
      if (borderObj.top == borderObj.bottom &&
          borderObj.top == borderObj.left &&
          borderObj.top == borderObj.right) {
        return borderObj.top;
      } else {
        // 如果边框不一致，使用top边作为默认
        return borderObj.top;
      }
    }

    return BorderSide.none;
  }

  /// 构建装饰
  Decoration? _buildDecoration() {
    final effectiveBorder = _buildBorder();

    // 如果没有任何装饰属性，返回null
    if (color == null &&
        gradient == null &&
        effectiveBorder == null &&
        boxShadow == null &&
        borderRadius == null) {
      return null;
    }

    // 如果没有圆角，使用普通的BoxDecoration
    if (borderRadius == null) {
      return BoxDecoration(
        color: color,
        gradient: gradient,
        border: effectiveBorder,
        boxShadow: boxShadow,
      );
    }

    // 使用平滑圆角
    final smoothBorderRadius = _convertToSmoothBorderRadius(borderRadius);
    if (smoothBorderRadius != null) {
      final borderSide = _buildBorderSide();

      return ShapeDecoration(
        color: color,
        gradient: gradient,
        shadows: boxShadow,
        shape: SmoothRectangleBorder(
          borderRadius: smoothBorderRadius,
          side: borderSide,
          borderAlign: BorderAlign.outside,
        ),
      );
    }

    // 回退到普通装饰
    return BoxDecoration(
      color: color,
      gradient: gradient,
      border: effectiveBorder,
      borderRadius: borderRadius,
      boxShadow: boxShadow,
    );
  }

  @override
  Widget build(BuildContext context) {
    final decoration = _buildDecoration();

    // 普通情况 - 让ShapeDecoration自己处理裁剪
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      alignment: alignment,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      decoration: decoration,
      child: child,
    );
  }
}

/// SmoothContainer的便捷构造函数集合
extension SmoothContainerExtensions on SmoothContainer {
  /// 创建圆形的SmoothContainer
  static SmoothContainer circle({
    Key? key,
    Widget? child,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? size,
    BoxBorder? border,
    double? borderWidth,
    Color? borderColor,
    BorderStyle? borderStyle,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    Clip clipBehavior = Clip.antiAlias,
    double cornerSmoothing = 0.6,
    AlignmentGeometry? alignment,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
  }) {
    final radius = (size ?? 50) / 2;
    return SmoothContainer(
      key: key,
      color: color,
      margin: margin,
      padding: padding,
      width: size,
      height: size,
      borderRadius: BorderRadius.circular(radius),
      border: border,
      borderWidth: borderWidth,
      borderColor: borderColor,
      borderStyle: borderStyle,
      boxShadow: boxShadow,
      gradient: gradient,
      clipBehavior: clipBehavior,
      cornerSmoothing: cornerSmoothing,
      alignment: alignment,
      transform: transform,
      transformAlignment: transformAlignment,
      child: child,
    );
  }

  /// 创建圆角矩形的SmoothContainer
  static SmoothContainer rounded({
    Key? key,
    Widget? child,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    double radius = 8.0,
    BoxBorder? border,
    double? borderWidth,
    Color? borderColor,
    BorderStyle? borderStyle,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    Clip clipBehavior = Clip.antiAlias,
    double cornerSmoothing = 0.6,
    AlignmentGeometry? alignment,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
  }) {
    return SmoothContainer(
      key: key,
      color: color,
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(radius),
      border: border,
      borderWidth: borderWidth,
      borderColor: borderColor,
      borderStyle: borderStyle,
      boxShadow: boxShadow,
      gradient: gradient,
      clipBehavior: clipBehavior,
      cornerSmoothing: cornerSmoothing,
      alignment: alignment,
      transform: transform,
      transformAlignment: transformAlignment,
      child: child,
    );
  }
}
