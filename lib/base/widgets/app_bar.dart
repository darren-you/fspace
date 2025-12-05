import 'dart:ui';

import 'package:fspace/base/base.dart';
import 'package:fspace/base/extension/build_context_extension.dart';
// ignore: unused_import
import 'package:fspace/base/widgets/bounce_marquee_text.dart';
import 'package:fspace/base/widgets/auto_marquee_text.dart';

import 'package:fspace/constants/app_define.dart';
import 'package:fspace/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MAppBar({
    super.key,
    this.child,
    this.backgroundColor = Colors.transparent,
    this.systemOverlayStyle,
    this.enabledBackdrop = false,
    this.enabledBackIcon = true,
    this.enabledBottomLine = true,
    this.leftIcon,
    this.rightIcon,
    this.backIconColor,
  });

  final Widget? child;
  final Color? backgroundColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool enabledBackdrop;
  final bool enabledBackIcon;
  final bool enabledBottomLine;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Color? backIconColor;

  @override
  Widget build(BuildContext context) {
    Widget appBar = AnnotatedRegion<SystemUiOverlayStyle>(
      value: systemOverlayStyle ?? kSystemUiOverlayStyle,
      child: Container(
        color: backgroundColor ?? context.appColors.appBarBackground,
        child: SafeArea(
          bottom: false,
          child: SizedBox(
            height: kMyToolBarHeight,
            child: _buildAppBar(context, child),
          ),
        ),
      ),
    );

    if (enabledBackdrop) {
      appBar = ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: appBar,
        ),
      );
    }

    return appBar;
  }

  Widget? _buildAppBar(BuildContext context, Widget? child) {
    final route = ModalRoute.of(context);
    final typeFullScreenDialog = route is PageRoute && route.fullscreenDialog;
    return Stack(
      children: [
        enabledBackIcon
            ? Align(
                alignment: Alignment.centerLeft,
                child: AppBarBackButton(
                  fullscreen: typeFullScreenDialog,
                  leftIcon: leftIcon,
                  backIconColor: backIconColor,
                ),
              )
            : SizedBox(),
        rightIcon != null
            ? Align(
                alignment: Alignment.centerRight,
                child: rightIcon,
              )
            : SizedBox(),
        Align(
          alignment: Alignment.center,
          child: child ?? const SizedBox(),
        ),

        /// 底部分割线
        enabledBottomLine
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 0.5,
                  color: const Color(0xFFCFCFCF),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kMyToolBarHeight);
}

Widget mAppBarTitleDefault(
    {required BuildContext context,
    required String title,
    Color? titleColor,
    bool isAutoScroll = true}) {
  // return isAutoScroll
  //     ? BounceMarqueeText(
  //         text: title,
  //         style: TextStyle(
  //           color: context.appColors.primary,
  //           fontSize: 20,
  //           fontWeight: FontWeight.w500,
  //         ),
  //         maxWidth: MediaQuery.of(context).size.width - 64 * 2, // 根据实际容器宽度设置
  //       )
  //     : Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16),
  //         child: Text(
  //           title,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             color: context.appColors.primary,
  //             fontSize: 20,
  //             fontWeight: FontWeight.w500,
  //           ),
  //           overflow: TextOverflow.ellipsis,
  //           maxLines: 1,
  //         ),
  //       );
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 64.0),
    child: isAutoScroll
        ? AutoMarqueeText(
            text: title,
            style: TextStyle(
              fontSize: 18,
              color: titleColor ?? context.appColors.primary,
            ),
            maxWidth: MediaQuery.of(context).size.width - 64 * 2, // 根据实际容器宽度设置
          )
        : Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: titleColor ?? context.appColors.primary,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
  );
}
