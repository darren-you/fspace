import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:fspace/app.dart';
import 'package:flutter/material.dart';
import 'package:fspace/base/animate/spring_curve.dart';
import 'package:lottie/lottie.dart';

class Toast {
  static void Function()? _cancelFunc;

  static void showError(dynamic e) {
    hideLoading();
    showMessage(e.toString());
  }

  static Future<void> showMessage(String message, {bool strong = false}) async {
    BotToast.showCustomText(
      duration: const Duration(seconds: 2),
      align: Alignment.center,
      wrapAnimation: (controller, cancelFunc, widget) => widget,
      wrapToastAnimation: (controller, cancelFunc, widget) => ScaleTransition(
        scale: controller.drive(CurveTween(curve: SpringCurve.slow)),
        child: widget,
      ),
      toastBuilder: (CancelFunc cancelFunc) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: const ShapeDecoration(
              shape: StadiumBorder(), color: Color(0xFF444444)
              //Colors.white.withValues(alpha: 0.9),
              ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 17,
              color: Color(0xFFFFFFFF),
              height: 24.0 / 17,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
    if (strong) await Future.delayed(const Duration(seconds: 1));
  }

  static void showLoading({String msg = ''}) {
    _cancelFunc = BotToast.showCustomLoading(
      useSafeArea: false,
      clickClose: false,
      backButtonBehavior: BackButtonBehavior.ignore,
      toastBuilder: (cancelFunc) {
        _cancelFunc = cancelFunc;
        return Opacity(
          opacity: 0.8,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black, //Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Lottie.asset(Assets.lotties.turn),
                ),
                msg.isNotEmpty
                    ? Text(
                        msg,
                        style:
                            const TextStyle(fontSize: 19, color: Colors.white),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showMakeLoading({String msg = ''}) {
    _cancelFunc = BotToast.showCustomLoading(
      useSafeArea: false,
      clickClose: false,
      backButtonBehavior: BackButtonBehavior.ignore,
      toastBuilder: (cancelFunc) {
        _cancelFunc = cancelFunc;
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white.withValues(alpha: 0.8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 193,
                  height: 241,
                  child: Lottie.asset(Assets.lotties.makeLoading),
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                msg.isNotEmpty
                    ? Text(
                        msg,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    : SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideLoading() {
    _cancelFunc?.call();
  }
}
