import 'package:flutter/material.dart';
import 'package:fspace/base/base.dart';
import 'package:fspace/base/extension/build_context_extension.dart';
import 'package:fspace/generated/l10n/l10n.dart';
import 'package:fspace/utils/screen_utils.dart';
import 'package:permission_handler/permission_handler.dart';

final limitTipHeight = 56.0;

Widget limmitPermissionTipWidget(BuildContext context) {
  return Container(
    color: Color(0xFFFDF1D9),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
    width: ScreenUtils.instance.screenWidth,
    height: limitTipHeight,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              t.photoPreview.photoPermissionLimitTitle,
              style: TextStyle(
                color: context.appColors.textMain.withValues(alpha: 0.6),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        CustomContainer(
          onTap: () {
            openAppSettings();
          },
          borderRadius: BorderRadius.circular(50),
          color: context.appColors.primaryYellow,
          child: Container(
            alignment: Alignment.center,
            height: 30,
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Text(
              t.photoPreview.photoPermissionLimitSet,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
