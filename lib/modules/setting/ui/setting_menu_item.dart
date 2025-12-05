import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fspace/base/widgets/custom_container.dart';
import 'package:fspace/generated/assets.gen.dart';

const _itemHeight = 56.0;

class SettingMenuItem extends StatelessWidget {
  const SettingMenuItem({
    super.key,
    required this.title,
    this.onClick,
  });

  final String title;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      duration: Duration(milliseconds: 100),
      scaleValue: 1,
      onTap: onClick?.call,
      child: Container(
        width: double.infinity,
        height: _itemHeight,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            SvgPicture.asset(
              Assets.svg.iconRight,
              width: 18,
              height: 18,
              colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: 0.3), BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }
}
