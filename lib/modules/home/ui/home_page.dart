import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fspace/base/widgets/line_widget.dart';
import 'package:fspace/constants/app_define.dart';
import 'package:fspace/modules/fun/ui/fun_page.dart';
import 'package:fspace/modules/mine/ui/mine_page.dart';
import 'package:fspace/modules/ui/ui/ui_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum HomePageTab {
  ui,
  fun,
  mine;

  static HomePageTab fromString(String value) {
    return HomePageTab.values.firstWhere(
      (tab) => tab.name == value,
      orElse: () => HomePageTab.ui,
    );
  }
}

class HomePage extends HookConsumerWidget {
  const HomePage({
    super.key,
    this.initialTab = HomePageTab.ui,
  });

  final HomePageTab initialTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pages = const [
      UiPage(),
      FunPage(),
      MinePage(),
    ];

    final currentIndex = useState(initialTab.index);

    final mediaQueryData = MediaQuery.of(context);
    final bottomBarHeight = mediaQueryData.padding.bottom + kMyNavBarHeight;

    Widget buildTextNavItem(int index, String label) {
      final isSelected = currentIndex.value == index;
      final color = isSelected ? Colors.black : Colors.grey;

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => currentIndex.value = index,
        child: Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness:
              Platform.isAndroid ? Brightness.dark : Brightness.light,
          statusBarIconBrightness:
              Platform.isAndroid ? Brightness.dark : Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarContrastEnforced: false,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: MediaQuery(
                data: mediaQueryData.copyWith(
                  padding: mediaQueryData.padding.copyWith(
                    bottom: mediaQueryData.viewInsets.bottom > 0
                        ? 0
                        : bottomBarHeight,
                  ),
                ),
                child: IndexedStack(
                  index: currentIndex.value,
                  children: pages,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Column(
                    children: [
                      LineWidget(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: const Offset(0, -2),
                            ),
                          ],
                        ),
                        child: SafeArea(
                          top: false,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              buildTextNavItem(0, 'UI'),
                              buildTextNavItem(1, '功能'),
                              buildTextNavItem(2, '我的'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
