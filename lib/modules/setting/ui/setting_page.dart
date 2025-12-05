import 'package:flutter/material.dart';
import 'package:fspace/base/widgets/app_bar.dart';
import 'package:fspace/base/widgets/line_spacer_widget.dart';
import 'package:fspace/base/widgets/line_widget.dart';
import 'package:fspace/constants/app_define.dart';
import 'package:fspace/modules/setting/ui/setting_menu_item.dart';
import 'package:fspace/providers/app_user_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MAppBar(
        enabledBackdrop: true,
        child: Text(
          '设置',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                kMyToolBarHeight,
          ),
          child: Column(
            children: [
              appInfoWidget(),
              LineWidget(),
              SettingMenuItem(
                title: '反馈建议',
                onClick: () {},
              ),
              LineSpacerWidget(),
              SettingMenuItem(
                title: '用户协议',
                onClick: () {},
              ),
              LineSpacerWidget(),
              SettingMenuItem(
                title: '隐私政策',
                onClick: () {},
              ),
              LineSpacerWidget(),
              SettingMenuItem(
                title: '版本更新',
                onClick: () {},
              ),
              LineSpacerWidget(),
              SettingMenuItem(
                title: '注销账号',
                onClick: () {},
              ),
              LineWidget(),
              const Padding(padding: EdgeInsets.only(bottom: 8)),
              LineWidget(),
              SettingMenuItem(
                title: '退出登录',
                onClick: () {
                  ref.read(appUserProvider.notifier).delete();
                  context.pop();
                },
              ),
              LineWidget(),
              const Padding(padding: EdgeInsets.only(bottom: 32)),
              icpInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

/// App 信息
Widget appInfoWidget() {
  return Column(
    children: [
      const Padding(padding: EdgeInsets.only(top: 32)),
      Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      const Padding(padding: EdgeInsets.only(bottom: 32)),
      Text(
        '知鲜阁',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Padding(padding: EdgeInsets.only(bottom: 4)),
      Text(
        'version 1.0.0',
        style: TextStyle(color: Colors.grey, fontSize: 17),
      ),
      const Padding(padding: EdgeInsets.only(bottom: 20)),
    ],
  );
}

/// 备案信息
Widget icpInfoWidget() {
  return LayoutBuilder(
    builder: (context, constraints) {
      return SafeArea(
        child: Center(
          child: Text(
            '备案编号: 蜀ICP备12345678号-01A',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withValues(alpha: 0.3),
            ),
          ),
        ),
      );
    },
  );
}
