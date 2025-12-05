import 'package:flutter/material.dart';
import 'package:fspace/base/widgets/app_bar.dart';
import 'package:fspace/constants/app_define.dart';
import 'package:fspace/providers/app_user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserProfilePage extends HookConsumerWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(appUserProvider);

    return Scaffold(
      appBar: MAppBar(
        enabledBackdrop: true,
        child: Text(
          '个人资料',
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
              const Padding(padding: EdgeInsets.only(top: 16)),
              if (user != null) ...[
                ListTile(
                  title: Text('用户id'),
                  subtitle: Text(user.id.toString()),
                ),
                ListTile(
                  title: Text('用户名'),
                  subtitle: Text(user.username),
                ),
                ListTile(
                  title: Text('手机号'),
                  subtitle: Text(user.phone),
                ),
                ListTile(
                  title: Text('用户类型'),
                  subtitle: Text(user.isVip.toString()),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
