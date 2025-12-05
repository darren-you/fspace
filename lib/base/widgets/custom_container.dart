import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// 自定义容器组件，支持点击动画、自动圆角检测等功能
///
/// 主要特性：
/// - 点击缩放动画
/// - 背景色和前景色动画
/// - 自动检测child的borderRadius
/// - 支持多种widget类型的圆角检测
///
/// 使用示例：
/// ```dart
/// // 基本用法
/// CustomContainer(
///   onTap: () => print('tapped'),
///   child: Text('Hello'),
/// )
///
/// // 自动检测圆角
/// CustomContainer(
///   autoDetectChildBorderRadius: true,
///   child: Container(
///     decoration: BoxDecoration(
///       borderRadius: BorderRadius.circular(12),
///     ),
///     child: Text('Auto Border Radius'),
///   ),
/// )
///
/// // 手动设置圆角（优先级高于自动检测）
/// CustomContainer(
///   borderRadius: BorderRadius.circular(8),
///   autoDetectChildBorderRadius: true,
///   child: Container(
///     decoration: BoxDecoration(
///       borderRadius: BorderRadius.circular(12), // 这个会被忽略
///     ),
///     child: Text('Manual Border Radius'),
///   ),
/// )
/// ```
///
/// 最佳实践：
/// - 当child有圆角时，建议启用autoDetectChildBorderRadius避免重复设置
/// - 对于深层嵌套的widget，可以适当调整maxDetectionDepth
/// - 性能敏感场景下可以禁用autoDetectChildBorderRadius并手动设置borderRadius
class CustomContainer extends HookWidget {
  /// 点击回调
  final VoidCallback? onTap;

  /// 按下回调
  final VoidCallback? onTapDown;

  /// 抬起回调
  final VoidCallback? onTapUp;

  /// 子组件
  final Widget? child;

  /// 动画持续时间
  final Duration duration;

  /// 动画开始颜色（用于背景色动画）
  final Color? startColor;

  /// 动画结束颜色（用于背景色动画）
  final Color? endColor;

  /// 背景颜色
  final Color? color;

  /// 外边距
  final EdgeInsetsGeometry? margin;

  /// 内边距
  final EdgeInsetsGeometry? padding;

  /// 宽度
  final double? width;

  /// 高度
  final double? height;

  /// 对齐方式
  final AlignmentGeometry? alignment;

  /// 圆角半径，如果为null且autoDetectChildBorderRadius为true，则自动从child检测
  final BorderRadiusGeometry? borderRadius;

  /// 形状
  final BoxShape? boxShape;

  /// 边框宽度
  final double? borderWidth;

  /// 边框颜色
  final Color? borderColor;

  /// 是否启用缩放动画
  final bool scale;

  /// 缩放值（0.0-1.0）
  final double scaleValue;

  /// 裁剪行为
  final Clip clipBehavior;

  /// 是否启用背景色动画
  final bool bgAnim;

  /// 是否启用前景色动画
  final bool foreAnim;

  /// 是否启用交互
  final bool enable;

  /// 禁止交互后的背景颜色
  final Color? disabledBgColor;

  /// 禁止交互后的前景颜色
  final Color? disabledFrgColor;

  /// 是否自动检测child的borderRadius
  /// 当此值为true且borderRadius为null时，会自动从child中提取borderRadius
  final bool autoDetectChildBorderRadius;

  /// 自动检测时的最大递归深度
  final int maxDetectionDepth;

  const CustomContainer({
    super.key,
    this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.child,
    this.duration = const Duration(milliseconds: 200),
    this.startColor,
    this.endColor,
    this.color = Colors.white,
    this.margin,
    this.padding,
    this.width,
    this.height,
    this.alignment,
    this.borderRadius,
    this.boxShape,
    this.borderWidth,
    this.borderColor,
    this.scale = true,
    this.scaleValue = 0.98,
    this.clipBehavior = Clip.hardEdge,
    this.bgAnim = false,
    this.foreAnim = true,
    this.enable = true,
    this.disabledBgColor,
    this.disabledFrgColor,
    this.autoDetectChildBorderRadius = true,
    this.maxDetectionDepth = 3,
  })  : assert(scaleValue >= 0.0 && scaleValue <= 1.0,
            'scaleValue must be between 0.0 and 1.0'),
        assert(
            maxDetectionDepth > 0, 'maxDetectionDepth must be greater than 0');

  /// 从child widget中提取borderRadius
  ///
  /// 支持的widget类型：
  /// - Container (BoxDecoration)
  /// - DecoratedBox (BoxDecoration)
  /// - ClipRRect
  /// - Material
  /// - Card (RoundedRectangleBorder)
  /// - AnimatedContainer (BoxDecoration)
  ///
  /// 支持的包装widget（会递归检查）：
  /// - Padding, Center, Align, SizedBox
  /// - Expanded, Flexible
  /// - Transform, Opacity
  ///
  /// [child] 要检查的widget
  /// [maxDepth] 最大递归深度，防止性能问题和无限递归
  ///
  /// 返回检测到的borderRadius，如果没有找到则返回null
  BorderRadiusGeometry? _extractChildBorderRadius(Widget? child,
      [int maxDepth = 3]) {
    if (child == null || maxDepth <= 0) return null;

    // 处理Container
    if (child is Container) {
      if (child.decoration is BoxDecoration) {
        final decoration = child.decoration as BoxDecoration;
        return decoration.borderRadius;
      }
    }

    // 处理DecoratedBox
    if (child is DecoratedBox) {
      if (child.decoration is BoxDecoration) {
        final decoration = child.decoration as BoxDecoration;
        return decoration.borderRadius;
      }
    }

    // 处理ClipRRect
    if (child is ClipRRect) {
      return child.borderRadius;
    }

    // 处理Material
    if (child is Material) {
      return child.borderRadius;
    }

    // 处理Card
    if (child is Card) {
      if (child.shape is RoundedRectangleBorder) {
        final shape = child.shape as RoundedRectangleBorder;
        return shape.borderRadius;
      }
    }

    // 递归检查常见的包装widget
    Widget? innerChild;
    if (child is Padding) {
      innerChild = child.child;
    } else if (child is Center) {
      innerChild = child.child;
    } else if (child is Align) {
      innerChild = child.child;
    } else if (child is SizedBox) {
      innerChild = child.child;
    } else if (child is Expanded) {
      innerChild = child.child;
    } else if (child is Flexible) {
      innerChild = child.child;
    } else if (child is Transform) {
      innerChild = child.child;
    } else if (child is Opacity) {
      innerChild = child.child;
    } else if (child is AnimatedContainer) {
      // AnimatedContainer也可能有decoration
      if (child.decoration is BoxDecoration) {
        final decoration = child.decoration as BoxDecoration;
        return decoration.borderRadius;
      }
    }

    // 递归检查内部widget（减少递归深度）
    if (innerChild != null) {
      return _extractChildBorderRadius(innerChild, maxDepth - 1);
    }

    return null;
  }

  /// 构建装饰
  Decoration? _buildDecoration(
    bool isDecoration,
    Color? color,
    BorderRadiusGeometry? borderRadius,
    BoxShape? boxShape,
  ) {
    if (color == null && borderRadius == null) return null;

    // 如果是enabled，则降低为30%的透明度
    // 可单独设置前景、背景色
    if (!enable) {
      if (isDecoration && disabledBgColor != null) {
        color = disabledBgColor;
      } else if (!isDecoration && disabledFrgColor != null) {
        color = disabledFrgColor;
      } else {
        color = color?.withValues(alpha: 0.3);
      }
    }

    // 使用普通的BoxDecoration
    return BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      shape: boxShape ?? BoxShape.rectangle,
      border: borderWidth != null
          ? Border.all(
              width: borderWidth!, color: borderColor ?? Colors.black)
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final animController = useAnimationController(duration: duration);
    final isPressed = useState(false);

    final scaleAnimation = useAnimation(
      Tween<double>(begin: 1.0, end: scaleValue).animate(
        CurvedAnimation(parent: animController, curve: Curves.decelerate),
      ),
    );

    final bgColorAnimation = useAnimation(
      ColorTween(
        begin: color == null
            ? startColor?.withValues(alpha: 1.0)
            : color?.withValues(alpha: 1.0),
        end: color == null
            ? endColor?.withValues(alpha: 0.8)
            : color?.withValues(alpha: 0.8),
      ).animate(
        CurvedAnimation(parent: animController, curve: Curves.decelerate),
      ),
    );

    final foreColorAnimation = useAnimation(
      ColorTween(
        begin: Colors.grey.withValues(alpha: 0.0),
        end: Colors.grey.withValues(alpha: 0.3),
      ).animate(
        CurvedAnimation(parent: animController, curve: Curves.decelerate),
      ),
    );

    void handleTapDown(TapDownDetails details) {
      if (!enable) {
        return;
      }
      isPressed.value = true;
      animController.forward();
      onTapDown?.call();
    }

    Future<void> handleTapUp(TapUpDetails details) async {
      if (!enable) {
        return;
      }
      onTapUp?.call();
      onTap?.call();

      if (isPressed.value) {
        await animController.animateTo(1.0);
        if (!context.mounted) return;
        await animController.reverse();
        if (!context.mounted) return;
        isPressed.value = false;
      } else {
        await animController.reverse();
      }
    }

    void handleTapCancel() {
      if (!enable) {
        return;
      }
      isPressed.value = false;
      animController.reverse();
    }

    // 智能获取borderRadius
    BorderRadiusGeometry? effectiveBorderRadius = borderRadius;
    if (autoDetectChildBorderRadius && borderRadius == null) {
      effectiveBorderRadius =
          _extractChildBorderRadius(child, maxDetectionDepth);
    }

    return GestureDetector(
      onTapDown: handleTapDown,
      onTapUp: handleTapUp,
      onTapCancel: handleTapCancel,
      behavior: HitTestBehavior.translucent,
      child: Transform.scale(
        scale: scale ? scaleAnimation : 1.0,
        child: Container(
          margin: margin,
          padding: padding,
          width: width,
          height: height,
          alignment: alignment,
          clipBehavior: clipBehavior,
          decoration: _buildDecoration(
            true,
            bgAnim ? bgColorAnimation : color,
            effectiveBorderRadius,
            boxShape,
          ),
          foregroundDecoration: _buildDecoration(
            false,
            foreAnim ? foreColorAnimation : color,
            effectiveBorderRadius,
            boxShape,
          ),
          child: child,
        ),
      ),
    );
  }
}
