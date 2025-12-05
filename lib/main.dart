import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fspace/app.dart';
import 'package:fspace/test/debug_panel_view.dart';
import 'package:fspace/generated/l10n/l10n.dart';
import 'package:fspace/providers/login_action_provider.dart';
import 'package:fspace/providers/router_provider.dart';
import 'package:fspace/theme.dart';
import 'package:fspace/utils/screen_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 开发时记得运行
// dart run build_runner watch

// 多语言生成命令
// dart run slang watch

// 修改版本号
// pubspec.yaml -> version: 1.0.0(版本号)+100000000(版本码)

// 打包Google Play
// flutter build appbundle --release

// 正式包记得关闭！！！
// final _debug = true;
final _debug = false;

void main() async {
  final _ = WidgetsFlutterBinding.ensureInitialized();
  // 停留在启动屏
  // FlutterNativeSplash.preserve(widgetsBinding: binding);
  // 热更新时重启动画，方便调试
  Animate.restartOnHotReload = true;
  await initBase();
  await initApp();

  runApp(
    ProviderScope(
      child: TranslationProvider(child: const MainApp()),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    ref.watch(loginActionProvider);
    final botToastBuilder = BotToastInit();

    return MaterialApp.router(
      title: 'Fspace',
      routerConfig: router,
      theme: themeData,
      darkTheme: themeData,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        physics: const BouncingScrollPhysics(),
        overscroll: true,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      // locale: const Locale('en', 'US'),
      locale: TranslationProvider.of(context).flutterLocale,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: AppLocaleUtils.supportedLocales,
      builder: (context, child) {
        // 初始化屏幕适配
        ScreenUtils.instance.init(
          context: context,
          designWidth: 393,
          designHeight: 852,
        );

        if (_debug) {
          child = botToastBuilder(context, child);
          return Stack(
            children: [
              child,
              const DraggableDebugPanel(),
            ],
          );
        } else {
          child = botToastBuilder(context, child);
          return child;
        }
      },
    );
  }
}
