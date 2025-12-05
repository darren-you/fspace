import 'dart:async';
import 'dart:convert';
import 'package:fspace/app.dart';
import 'dart:io';

import 'package:fspace/base/base.dart';
import 'package:fspace/base/extension/build_context_extension.dart';
import 'package:fspace/constants/app_define.dart';
import 'package:fspace/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fspace/utils/logger_util.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'loading_view.dart';

final String _tag = 'WebViewPage';

typedef JavaScriptCallback = dynamic Function(Map arg);

class WebViewPage extends ConsumerStatefulWidget {
  const WebViewPage({
    super.key,
    required this.url,
    this.title,
    this.embedded = false,
  });

  final String url;
  final String? title;
  final bool embedded;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends ConsumerState<WebViewPage> with RouteAware {
  String _title = '';
  double _progress = 0;
  late Map<String, JavaScriptCallback> _handlers;

  bool _canBack = false;
  bool _hideAppBar = false;
  bool _firstPageLoaded = false;
  String _url = '';
  WebViewController? _controller;
  final _keybordVisibilityController = KeyboardVisibilityController();
  StreamSubscription? _keyboardSub;
  bool _needHandleBack = false;
  String _willBackUrl = '';

  /// 返回上一页
  void _goBackNative() async {
    final canGoBack = (await _controller?.canGoBack()) ?? false;
    if (canGoBack) {
      final url = await _controller?.currentUrl();
      if (Platform.isAndroid) {
        _needHandleBack = true;
        _willBackUrl = url ?? '';
      }
      await _controller?.goBack();
    } else {
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  String _handleUrl(String url) {
    return url;
  }

  void _updateUrl() {
    String url = widget.url;
    try {
      url = Uri.decodeFull(url);
    } catch (e) {
      Logger.error('decodeFull出错', tag: _tag);
    }
    url = _handleUrl(url);
    _hideAppBar = url.contains('hideappbar=1');
    _url = url;
  }

  /// 注入js调用原生方法能力
  void _injectionJS() async {
    try {
      final notFound = await _controller?.runJavaScriptReturningResult(
          'window.invokeWnl == undefined || window.invokeWnl == null');
      if (notFound is bool && !notFound) return;
    } catch (e) {
      Logger.error('检测注入invokeWnl错误', tag: _tag);
      return;
    }
    Logger.warning('未注入invokeWnl', tag: _tag);
    try {
      _runJavaScript('''
        window.invokeWnl = function (cmd) {
          return prompt("__invoke__" + JSON.stringify(cmd), undefined);
        };
        ''');
    } catch (e) {
      Logger.error('注入invokeWnl错误', tag: _tag);
    }
  }

  /// 获取webview标题
  void _getTitle() async {
    final r = await _controller?.runJavaScriptReturningResult('document.title');
    var t = '';
    if (r is String) t = r;
    if (t.startsWith('"') && t.endsWith('"') && t.length > 2) {
      t = t.substring(1, t.length - 1);
    }
    if (t == '""') t = '';
    if (!mounted) return;
    setState(() {
      _title = t;
    });
  }

  Future<void> _initUserAgent() async {}

  void _fixedAndroidKeyboard() {
    if (Platform.isAndroid) {
      _keyboardSub = _keybordVisibilityController.onChange.listen((event) {
        if (mounted && event) {
          Future.delayed(const Duration(milliseconds: 350)).whenComplete(() {
            if (!mounted) return;
            _runJavaScript(
                'document.activeElement.scrollIntoView({behavior: "smooth", block: "nearest"});');
          });
        }
      });
    }
  }

  void _initLoad() async {
    // 加载链接之前需要等待userAgent设置完毕，不然可能会导致canGoBack这些方法失效
    await _initUserAgent();
    final uri = Uri.tryParse(_url);
    if (uri != null) _controller?.loadRequest(uri);
  }

  void _runJavaScript(String js) async {
    try {
      Logger.error('调用js方法: $js', tag: _tag);
      await _controller?.runJavaScript(js);
    } catch (e) {
      Logger.error('调用js方法出错: $js, $e', tag: _tag);
    }
  }

  NavigationDelegate get _navigationDelegate => NavigationDelegate(
        onNavigationRequest: (request) async {
          if (!mounted) return NavigationDecision.prevent;
          // 安卓重写onNavigationRequest后会导致重定向后导航栈出问题，canGoBack一直为true
          // 这里判断一下即将导航的链接跟点击返回时当前链接一致，直接退出页面
          // 问题详情: https://github.com/flutter/flutter/issues/137737
          if (Platform.isAndroid &&
              _needHandleBack &&
              Uri.parse(_willBackUrl) == Uri.parse(request.url)) {
            _needHandleBack = false;
            Navigator.of(context).pop();
            return NavigationDecision.prevent;
          }
          // 解决h5内写类似于`location.href = protocol://getuserinfo#userinfocallback`
          // 导致webview错误重定向，不加载当前页未加载完成的资源
          final url = request.url;
          if (url.startsWith('http')) {
            return NavigationDecision.navigate;
          }
          final index = kURLSchemes.indexWhere((e) => url.startsWith(e));
          if (index != -1) {
            context.openURL(url);
            return NavigationDecision.prevent;
          }
          if (url.startsWith('protocol')) {
            final protocol = url.split('#');
            final name =
                protocol[0].toLowerCase().replaceFirst('protocol://', '');
            Map args = {};
            if (url.length > 1) {
              args['callback'] = protocol[1];
            }
            if (mounted) _handlers[name]?.call(args);
            Logger.error('js调用方法：$url', tag: _tag);
            return NavigationDecision.prevent;
          }
          context.openURL(url);
          return NavigationDecision.prevent;
        },
        onPageStarted: (url) {
          Logger.error('onLoadStart', tag: _tag);
          if (Platform.isAndroid) _injectionJS();
          if (!mounted) return;
          setState(() {
            _progress = 0;
          });
        },
        onProgress: (progress) {
          Logger.error('onProgress: $progress', tag: _tag);
          if (!mounted) return;
          setState(() {
            _progress = progress / 100;
            if (_progress >= 1) {
              if (!_firstPageLoaded) {
                _firstPageLoaded = true;
              }
            }
          });
        },
        onPageFinished: (url) async {
          if (!mounted) return;
          Logger.error('onPageFinished: $url', tag: _tag);
          _getTitle();
          _controller?.canGoBack().then((value) {
            if (!mounted) return;
            setState(() {
              _canBack = value;
              Logger.error('canGoBack: $_canBack', tag: _tag);
            });
          });

          Future.delayed(const Duration(seconds: 1)).whenComplete(() async {
            if (mounted) _getTitle();
          });

          setState(() {
            _progress = 1;
          });
        },
        onUrlChange: (change) {
          Logger.error('onUrlChange: ${change.url}', tag: _tag);
          _controller?.canGoBack().then((value) {
            if (!mounted) return;
            setState(() {
              _canBack = value;
              Logger.error('canGoBack: $_canBack', tag: _tag);
            });
          });
        },
      );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final a = ModalRoute.of(context) as PageRoute?;
    if (a != null) {
      routeObserver.subscribe(this, a);
    }
  }

  @override
  void didPushNext() {
    super.didPushNext();
    _runJavaScript('if(window.onAppDisapear){window.onAppDisapear();}');
    if (Platform.isAndroid) {
      // 安卓触发不了浏览器visibilitychange方法
      _runJavaScript('''
        Object.defineProperty(document, 'visibilityState', {value: 'hidden', writable: true});
        Object.defineProperty(document, 'hidden', {value: true, writable: true});
        document.dispatchEvent(new Event("visibilitychange"));
      ''');
    }
  }

  @override
  void didPopNext() {
    super.didPopNext();
    _runJavaScript('if(window.onAppVisible){window.onAppVisible();}');

    if (Platform.isAndroid) {
      // 安卓触发不了浏览器visibilitychange方法
      _runJavaScript('''
        Object.defineProperty(document, 'visibilityState', {value: 'visible', writable: true});
        Object.defineProperty(document, 'hidden', {value: false, writable: true});
        document.dispatchEvent(new Event("visibilitychange"));
      ''');
    }
  }

  @override
  void initState() {
    super.initState();
    _fixedAndroidKeyboard();

    _handlers = {};

    _updateUrl();
    if (Platform.isAndroid) {
      _controller = WebViewController();
      final c = _controller?.platform as AndroidWebViewController?;
      c?.setMediaPlaybackRequiresUserGesture(false);
    } else {
      _controller = WebViewController.fromPlatformCreationParams(
        WebKitWebViewControllerCreationParams
            .fromPlatformWebViewControllerCreationParams(
          const PlatformWebViewControllerCreationParams(),
          mediaTypesRequiringUserAction: const {},
          allowsInlineMediaPlayback: true,
        ),
      );
    }
    _controller!
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(_navigationDelegate)
      ..setOnJavaScriptTextInputDialog((request) async {
        final message = request.message;
        if (message.startsWith('__invoke__')) {
          final jsonString = message.replaceAll('__invoke__', '');
          final obj = jsonDecode(jsonString);
          Logger.error('js调用方法：$obj', tag: _tag);
          final name = (obj['command'] as String).toLowerCase();
          final args = obj['args'] ?? {};
          if (mounted) _handlers[name]?.call(args);
        }
        return '';
      })
      ..setOnConsoleMessage((message) {
        Logger.error('Console: ${message.message}', tag: _tag);
      });

    _initLoad();
  }

  @override
  void dispose() {
    _controller = null;
    _keyboardSub?.cancel();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var firstLoadingViewOpacity = 0.0;

    final webview = _controller != null
        ? WebViewWidget(
            controller: _controller!,
            gestureRecognizers: {
              Factory<VerticalDragGestureRecognizer>(
                () => VerticalDragGestureRecognizer(),
              ),
              Factory<HorizontalDragGestureRecognizer>(
                () => HorizontalDragGestureRecognizer(),
              ),
            },
          )
        : const SizedBox();

    Widget child = Stack(
      children: [
        Positioned.fill(
          // 有些设备上底部会差1px
          bottom: -1,
          child: webview,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: AnimatedOpacity(
              opacity:
                  firstLoadingViewOpacity == 0 ? (_progress == 1 ? 0 : 1) : 0,
              duration: const Duration(milliseconds: 250),
              child: LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.transparent,
                minHeight: 5,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedOpacity(
              opacity: firstLoadingViewOpacity,
              duration: const Duration(milliseconds: 250),
              child: const LoadingView(),
            ),
          ),
        ),
      ],
    );
    if (widget.embedded) return child;

    final route = ModalRoute.of(context);
    final needBack =
        route is PageRoute && (route.canPop || route.fullscreenDialog);

    final appBar = SizedBox(
      height: MediaQuery.paddingOf(context).top + 44,
      child: MAppBar(
        enabledBackIcon: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: needBack
                  ? CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      onPressed: _goBackNative,
                      child: _canBack
                          ? SvgPicture.asset(
                              Assets.svg.iconBack,
                              width: 28,
                              height: 28,
                              colorFilter: ColorFilter.mode(
                                  Colors.black, BlendMode.srcIn),
                            )
                          : SvgPicture.asset(
                              Assets.svg.iconClose1,
                              width: 14,
                              height: 14,
                              colorFilter: ColorFilter.mode(
                                  Colors.black, BlendMode.srcIn),
                            ),
                    )
                  : const SizedBox(),
            ),
            // Title
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.title ?? _title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return PopScope(
      // 苹果系统使用此功能会导致侧滑返回失效
      canPop: !Platform.isAndroid,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _goBackNative();
      },
      child: Scaffold(
        // 苹果端不能让页面跟着键盘变小，键盘会挡住输入框
        // 安卓端需要页面跟着变小，页面底部才会留出位置
        resizeToAvoidBottomInset: Platform.isAndroid,
        body: Column(
          children: [
            if (!_hideAppBar) appBar,
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
