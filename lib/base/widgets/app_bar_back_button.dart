import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fspace/generated/assets.gen.dart';
import 'package:go_router/go_router.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
    this.fullscreen = false,
    this.leftIcon,
    this.backIconColor,
  });

  final bool fullscreen;
  final Widget? leftIcon;
  final Color? backIconColor;

  @override
  Widget build(BuildContext context) {
    if (leftIcon != null) {
      return leftIcon!;
    }
    if (fullscreen) {
      return CupertinoButton(
        onPressed: () => context.pop(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SvgPicture.asset(
          Assets.svg.iconDown,
          width: 28,
          height: 28,
          colorFilter:
              ColorFilter.mode(backIconColor ?? Colors.black, BlendMode.srcIn),
        ),
      );
    }

    // Svg不显示
    return CupertinoButton(
      // padding: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SvgPicture.asset(
        Assets.svg.iconBack,
        width: 28,
        height: 28,
        colorFilter:
            ColorFilter.mode(backIconColor ?? Colors.black, BlendMode.srcIn),
      ),
      onPressed: () => context.pop(),
    );

    // return CupertinoButton(
    //   // padding: EdgeInsets.zero,
    //   padding: const EdgeInsets.symmetric(horizontal: 12),
    //   child: Image.asset(
    //     Assets.images.appBarBack.path,
    //     width: 28,
    //     height: 28,
    //   ),
    //   onPressed: () => context.pop(),
    // );
  }
}
