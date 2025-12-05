import 'package:fspace/base/base.dart';
import 'package:fspace/base/extension/build_context_extension.dart';
import 'package:fspace/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fspace/generated/l10n/l10n.dart';
import 'package:permission_handler/permission_handler.dart';

/// 打开系统权限设置页
class SystemPermissionPage extends HookConsumerWidget {
  const SystemPermissionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MAppBar(
        enabledBottomLine: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.svg.photoPermission),
              Padding(padding: EdgeInsets.only(bottom: 12)),
              Text(
                t.SystemPermission.title,
                style: TextStyle(
                  color: context.appColors.textMain,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(bottom: 8)),
              Text(
                t.SystemPermission.description,
                style: TextStyle(
                  color: context.appColors.textMain,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(bottom: 27)),
              CustomContainer(
                color: Colors.black,
                onTap: () async {
                  openAppSettings();
                },
                borderRadius: BorderRadius.circular(200),
                child: SizedBox(
                  height: 52,
                  width: 225,
                  child: Center(
                    child: Text(
                      t.SystemPermission.authorization,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
