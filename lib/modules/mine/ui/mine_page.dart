import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fspace/base/extension/build_context_extension.dart';
import 'package:fspace/base/widgets/line_widget.dart';
import 'package:fspace/base/widgets/network_image_view.dart';
import 'package:fspace/generated/assets.gen.dart';
import 'package:fspace/modules/mine/ui/menu_item.dart';
import 'package:fspace/providers/app_user_provider.dart';
import 'package:fspace/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MinePage extends ConsumerWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQueryData = MediaQuery.of(context);
    var statusBarHeight = mediaQueryData.padding.top;
    final appUserNotifier = ref.watch(appUserProvider);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => UserProfileRoute().push(context),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.white,
                            context.appColors.mainBackground,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          // 用户信息
                          appUserNotifier != null
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: statusBarHeight + 36,
                                    bottom: 16,
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(left: 16)),
                                      Container(
                                        width: 60,
                                        height: 60,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(80),
                                        ),
                                        child: NetworkImageView(
                                          url: appUserNotifier.avatar,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(left: 16)),
                                      SizedBox(
                                        height: 60,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              appUserNotifier.username,
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'id: ',
                                                  style: TextStyle(
                                                    color: context
                                                        .appColors.textSecond,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Text(
                                                  appUserNotifier.id.toString(),
                                                  style: TextStyle(
                                                    color: context
                                                        .appColors.textSecond,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(child: const SizedBox()),
                                      SvgPicture.asset(
                                        Assets.svg.iconRight,
                                        width: 18,
                                        height: 18,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withValues(alpha: 0.3),
                                            BlendMode.srcIn),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 16),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  height: 60,
                                  // color: Colors.amberAccent,
                                  margin: EdgeInsets.only(
                                    top: statusBarHeight + 6,
                                    bottom: 6,
                                  ),
                                  child: Row(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(left: 16)),
                                      Text(
                                        '去登录',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(child: const SizedBox()),
                                      SvgPicture.asset(
                                        Assets.svg.iconRight,
                                        width: 18,
                                        height: 18,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withValues(alpha: 0.3),
                                            BlendMode.srcIn),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 16),
                                      ),
                                    ],
                                  ),
                                ),
                          LineWidget(),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 16)),
                  Column(
                    children: [
                      LineWidget(),
                      MenuItem(
                        icon: Assets.svg.iconSetting,
                        title: '设置',
                        onClick: () {
                          SettingRoute().push(context);
                        },
                      ),
                      LineWidget(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
