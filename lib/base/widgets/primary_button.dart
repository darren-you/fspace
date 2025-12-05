import 'package:fspace/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fspace/base/extension/build_context_extension.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.fontWeight,
    this.fontSize = 17,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;
  final FontWeight? fontWeight;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: onTap != null ? 1 : 0.3,
      duration: const Duration(milliseconds: 200),
      curve: SpringCurve.slow,
      child: CupertinoButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        child: Container(
          height: 52,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(52),
          ),
          child: Text(
            title,
            strutStyle: StrutStyle(
              fontSize: fontSize,
              leading: 0,
              height: 1.2,
              forceStrutHeight: true,
            ),
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.bold,
              color: context.appColors.textMain,
            ),
          ),
        ),
      ),
    );
  }
}
