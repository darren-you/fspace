import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:fspace/base/widgets/smooth_container.dart';

/// 权限使用说明弹窗
class PermissionUsageInstructionsDialog {
  PermissionUsageInstructionsDialog({
    required this.dialogId,
    required this.title,
    required this.descriptions,
    this.onDismiss,
    this.onShowed,
  });

  final String dialogId;
  final String title;
  final String descriptions;
  final void Function(PermissionUsageInstructionsDialog)? onDismiss;
  final void Function(PermissionUsageInstructionsDialog)? onShowed;

  // 存储动画反向函数
  Future<void> Function()? _reverseAnimationSequence;

  Future<void> dismiss() async {
    // 如果有反向动画函数，先执行反向动画
    if (_reverseAnimationSequence != null) {
      await _reverseAnimationSequence!();
    }

    onDismiss?.call(this);
    BotToast.removeAll(dialogId);
  }

  Future<void> show() {
    return Future.value(
      BotToast.showAnimationWidget(
        groupKey: dialogId,
        clickClose: false,
        allowClick: true,
        onlyOne: true,
        crossPage: true,
        backButtonBehavior: BackButtonBehavior.none,
        animationDuration: const Duration(milliseconds: 300),
        wrapToastAnimation: (controller, cancel, child) {
          // 设置反向动画函数
          _reverseAnimationSequence = () async {
            try {
              await controller.reverse();
            } catch (e) {
              // 忽略动画过程中的异常（如控制器已被销毁）
              debugPrint('Animation reverse error: $e');
            }
          };

          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: controller,
              curve: Curves.easeOut,
            )),
            child: child,
          );
        },
        toastBuilder: (cancelFunc) {
          return SafeArea(
            child: SmoothContainer(
              width: double.infinity,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              padding: const EdgeInsets.all(20),
              borderRadius: BorderRadius.circular(34),
              border: Border.all(color: Colors.black, width: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    descriptions,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ).whenComplete(() => onShowed?.call(this));
  }
}
