import 'package:flutter/material.dart';
import 'package:fspace/constants/app_define.dart';
import 'package:fspace/router.dart';
import 'package:fspace/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

extension BuildContextExt on BuildContext {
  void openURL(String url) {
    if (url.startsWith('http')) {
      url = Uri.encodeComponent(url);
      url = Uri.encodeFull(url);

      push('/web?url=$url');
      return;
    }
    final index = kURLSchemes.indexWhere((e) => url.startsWith('$e:/'));
    if (index != -1) {
      final urlScheme = kURLSchemes[index];
      var pURL = url.replaceFirst('$urlScheme:/', '');
      var lastIndex = pURL.indexOf('?');
      if (lastIndex == -1) {
        lastIndex = pURL.length;
      }
      final routePath = pURL.substring(1, lastIndex);
      if (routePath == 'home') {
        go(pURL);
      } else {
        push(pURL);
      }
    } else {
      launchUrl(Uri.parse(url));
    }
  }

  void dismissKeyboard() {
    FocusScope.of(this).requestFocus(FocusNode());
  }

  AppColors get appColors => Theme.of(this).extension<AppColors>()!;

  // AppStyles get appStyles => Theme.of(this).extension<AppStyles>()!;

  /// 跳转登录页
  Future<T?> pushLoginPage<T>(WidgetRef ref) {
    return LoginPageRoute().push(this);
  }
}
