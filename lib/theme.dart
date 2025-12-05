import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fspace/base/animate/spring_curve.dart';

/// 设置App状态栏、导航栏颜色
final kSystemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Platform.isAndroid ? Brightness.dark : Brightness.light,
  statusBarIconBrightness:
      Platform.isAndroid ? Brightness.dark : Brightness.light,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarContrastEnforced: false,
);

final kSystemUiOverlayLightStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  statusBarBrightness: Platform.isAndroid ? Brightness.light : Brightness.dark,
  statusBarIconBrightness:
      Platform.isAndroid ? Brightness.light : Brightness.dark,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarDividerColor: Colors.transparent,
  systemNavigationBarContrastEnforced: false,
);

/// 扩展Theme自定义AppColors
/// 通过BuildContext对象.appColors调用
class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color primaryYellow;
  final Color primaryLight;
  final Color mainBackground;
  final Color appBarBackground;
  final Color divider;
  final Color textMain;
  final Color textSecond;
  final Color textThird;

  const AppColors({
    required this.primary,
    required this.primaryYellow,
    required this.primaryLight,
    required this.mainBackground,
    required this.appBarBackground,
    required this.divider,
    required this.textMain,
    required this.textSecond,
    required this.textThird,
  });

  @override
  ThemeExtension<AppColors> copyWith() {
    return AppColors(
      primary: primary,
      primaryYellow: primaryYellow,
      primaryLight: primaryLight,
      mainBackground: mainBackground,
      appBarBackground: appBarBackground,
      divider: divider,
      textMain: textMain,
      textSecond: textSecond,
      textThird: textThird,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other == null) return this;
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      primaryYellow:
          Color.lerp(primaryYellow, other.primaryYellow, t) ?? primaryYellow,
      primaryLight:
          Color.lerp(primaryLight, other.primaryLight, t) ?? primaryLight,
      mainBackground:
          Color.lerp(mainBackground, other.mainBackground, t) ?? mainBackground,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t) ??
              appBarBackground,
      divider: Color.lerp(divider, other.divider, t) ?? divider,
      textMain: Color.lerp(textMain, other.textMain, t) ?? textMain,
      textSecond: Color.lerp(textSecond, other.textSecond, t) ?? textSecond,
      textThird: Color.lerp(textThird, other.textThird, t) ?? textThird,
    );
  }
}

/// 扩展Theme自定义AppStyle
/// 通过BuildContext对象.appStyles调用
class AppStyles extends ThemeExtension<AppStyles> {
  AppStyles({
    required this.mainGradient,
    required this.primaryButtonDecoration,
  });

  final Gradient mainGradient;
  final Decoration primaryButtonDecoration;

  @override
  AppStyles copyWith() {
    return AppStyles(
      mainGradient: mainGradient,
      primaryButtonDecoration: primaryButtonDecoration,
    );
  }

  @override
  ThemeExtension<AppStyles> lerp(
      covariant ThemeExtension<AppStyles>? other, double t) {
    if (other == null) return this;
    if (other is! AppStyles) {
      return this;
    }

    return AppStyles(
      mainGradient:
          Gradient.lerp(mainGradient, other.mainGradient, t) ?? mainGradient,
      primaryButtonDecoration: Decoration.lerp(
              primaryButtonDecoration, other.primaryButtonDecoration, t) ??
          primaryButtonDecoration,
    );
  }
}

/// 扩展定义AppColors
AppColors _appColors = AppColors(
  primary: Colors.black,
  primaryYellow: Color(0XFFFFD860),
  primaryLight: Colors.white,
  mainBackground: const Color(0xFFF8F8F8),
  appBarBackground: const Color(0xFFF8F8F8),
  divider: const Color(0xFFE6E6E6),
  textMain: const Color(0xFF333333),
  textSecond: const Color(0xFF333333).withValues(alpha: 0.5),
  textThird: const Color(0xFF333333).withValues(alpha: 0.3),
);

/// 定义App主题样式
final themeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: 'FZLanTYK_Zhun',
  colorScheme: ColorScheme.light(
    primary: _appColors.primary,
  ),
  primaryColor: _appColors.primary,
  fontFamilyFallback: const ['FZLanTYK_Zhun'],
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: _appColors.appBarBackground,
    systemOverlayStyle: kSystemUiOverlayStyle,
    centerTitle: true,
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamilyFallback: ['FZLanTYK_Zhun'],
      letterSpacing: 0,
    ),
  ),
  textTheme: TextTheme(
    // 大部分地方的文字颜色
    bodyMedium: TextStyle(
      color: _appColors.textMain,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
    ),
    // 大部分地方的文字颜色
    titleMedium: TextStyle(
      color: _appColors.textMain,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
    ),
  ),
  cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: _appColors.primary,
    textTheme: const CupertinoTextThemeData(
      textStyle: TextStyle(
        // 默认不为0
        letterSpacing: 0,
        fontFamilyFallback: ['HarmonyOS Sans SC'],
      ),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: _appColors.textMain,
  ),
  dividerTheme: DividerThemeData(
    color: _appColors.divider,
    thickness: 0.5,
  ),
  dividerColor: _appColors.divider,
  scaffoldBackgroundColor: _appColors.mainBackground,
  // scaffoldBackgroundColor: Colors.amber,
  tabBarTheme: TabBarThemeData(dividerColor: Colors.transparent),
  extensions: [
    _appColors,
  ],
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
);

/// 弹窗动画
/// 从顶部滑入的动画效果
Widget topSlideAnimation(
  BuildContext context,
  Animation<double> animation,
  Widget child,
) {
  final slideAnimation =
      Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0))
          .chain(CurveTween(curve: SpringCurve.slow))
          .animate(animation);
  return Align(
    alignment: Alignment.topCenter,
    child: SlideTransition(
      position: slideAnimation,
      child: child,
    ),
  );
}

/// 从底部滑入的动画效果
Widget bottomSlideAnimation(
  BuildContext context,
  Animation<double> animation,
  Widget child,
) {
  final slideAnimation =
      Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
          .chain(CurveTween(curve: SpringCurve.slow))
          .animate(animation);
  return Align(
    alignment: Alignment.bottomCenter,
    child: SlideTransition(
      position: slideAnimation,
      child: child,
    ),
  );
}

/// 简单的淡出淡入动画效果
/// 使用 FadeTransition 实现页面切换时的淡入淡出效果
Widget popFadeAnimationSample(
    BuildContext context, Animation<double> animation, Widget child) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, child) {
      if (animation.status == AnimationStatus.reverse) {
        // 页面退出时的动画效果
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
          ),
          child: child,
        );
      }
      // 页面进入时的动画效果
      return FadeTransition(
        opacity: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
        ),
        child: child,
      );
    },
    child: child,
  );
}

/// 从屏幕中间逐渐放大出现的动画效果
/// 结合淡入和缩放动画，实现从中心点放大的视觉效果
Widget popScaleAnimation(
    BuildContext context, Animation<double> animation, Widget child) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, child) {
      if (animation.status == AnimationStatus.reverse) {
        // 页面退出时的动画效果：淡出并缩小
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeIn,
            ),
          ),
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.8,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeIn,
              ),
            ),
            child: child,
          ),
        );
      }
      // 页面进入时的动画效果：从小到大放大并淡入
      return FadeTransition(
        opacity: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
        ),
        child: ScaleTransition(
          scale: Tween<double>(
            begin: 0.3,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutBack,
            ),
          ),
          child: child,
        ),
      );
    },
    child: child,
  );
}
