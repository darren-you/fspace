import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fspace/app.dart';
import 'package:fspace/base/base.dart';
import 'package:fspace/base/extension/build_context_extension.dart';
import 'package:fspace/constants/app_define.dart';
import 'package:fspace/managers/protocol_manager.dart';
import 'package:fspace/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// App同意协议界面
class AppProtocolPage extends HookConsumerWidget {
  const AppProtocolPage({super.key});

  // 退出应用
  void _exitApp() {
    ProtocolManager.instance.removeAgreedAppProtocol();
    SystemNavigator.pop();
  }

  // 同意协议
  Future<void> _agreeProtocol(BuildContext context) async {
    ProtocolManager.instance.setAgreedAppProtocol();
    await initApp();
    if (context.mounted) MainRoute(tab: 'foods').go(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showRemind = useState(false);
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MAppBar(
          enabledBackIcon: false,
        ),
        body: Center(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, 0.1),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  )),
                  child: child,
                ),
              );
            },
            child: !showRemind.value
                ? CustomContainer(
                    key: ValueKey('protocol'),
                    enable: false,
                    disabledFrgColor: Colors.transparent,
                    disabledBgColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  // height: 56,
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 26, bottom: 16),
                                    child: Text(
                                      '欢迎使用 知鲜阁',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: AlwaysScrollableScrollPhysics(),
                                    child: Container(
                                      // color: Colors.red,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '在您使用服务之前，请您务必审慎阅读、充分理解',
                                              style: TextStyle(
                                                color: context
                                                    .appColors.textSecond,
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '《服务协议》',
                                              style: TextStyle(
                                                color:
                                                    CupertinoColors.activeGreen,
                                                fontSize: 16,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  context.openURL(kSupportURL);
                                                },
                                            ),
                                            TextSpan(
                                              text: '和',
                                              style: TextStyle(
                                                color: context
                                                    .appColors.textSecond,
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '《隐私政策》',
                                              style: TextStyle(
                                                color:
                                                    CupertinoColors.activeGreen,
                                                fontSize: 16,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  context.openURL(kPrivacyURL);
                                                },
                                            ),
                                            TextSpan(
                                              text: '各条款。',
                                              style: TextStyle(
                                                color: context
                                                    .appColors.textSecond,
                                                fontSize: 16,
                                              ),
                                            ),
                                            TextSpan(
                                              text: """
                        \n我们将按照您同意的条款使用您的个人信息，以便为您提供服务。您可以在“设置”中查看、变更、删除个人信息并管理你的授权。请确认是否同意并继续。
                        """,
                                              style: TextStyle(
                                                color: context
                                                    .appColors.textSecond,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Center(
                                //   child: Text(
                                //       'agree: ${ProtocolManager.instance.agreedAppProtocolStatus()}'),
                                // ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomContainer(
                                    duration: Duration(milliseconds: 160),
                                    scaleValue: 0.99,
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () => showRemind.value = true,
                                    color: Colors.grey.withValues(alpha: 0.3),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '不同意',
                                        style: TextStyle(
                                          color: context.appColors.textSecond,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 16)),
                                Expanded(
                                  child: CustomContainer(
                                    duration: Duration(milliseconds: 160),
                                    scaleValue: 0.99,
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () async {
                                      await _agreeProtocol(context);
                                    },
                                    color: Colors.black,
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '同意并继续',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : CustomContainer(
                    key: ValueKey('remind'),
                    enable: false,
                    disabledFrgColor: Colors.transparent,
                    disabledBgColor: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    child: SizedBox(
                      height: 260,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  // height: 56,
                                  alignment: Alignment.center,
                                  color: Colors.white,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(top: 26, bottom: 16),
                                    child: Text(
                                      '温馨提示',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    physics: AlwaysScrollableScrollPhysics(),
                                    child: Container(
                                      // color: Colors.red,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  """你需要同意用户协议与隐私政策才能继续使用，若你不同意本用户协议与隐私政策，很遗憾我们将无法为你提供服务。""",
                                              style: TextStyle(
                                                color: context
                                                    .appColors.textSecond,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomContainer(
                                    duration: Duration(milliseconds: 160),
                                    scaleValue: 0.99,
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: _exitApp,
                                    color: Colors.grey.withValues(alpha: 0.3),
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '退出应用',
                                        style: TextStyle(
                                          color: context.appColors.textSecond,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 16)),
                                Expanded(
                                  child: CustomContainer(
                                    duration: Duration(milliseconds: 160),
                                    scaleValue: 0.99,
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () {
                                      showRemind.value = false;
                                    },
                                    color: Colors.black,
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '查看协议',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
