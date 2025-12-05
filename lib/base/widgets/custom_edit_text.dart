import 'package:fspace/base/base.dart';
import 'package:fspace/base/extension/build_context_extension.dart';

import 'package:fspace/generated/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fspace/providers/keyboard_height_provider.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomEditText extends HookConsumerWidget {
  const CustomEditText({
    super.key,
    required this.textController,
    this.wrapWidgetKey,
    this.padding = const EdgeInsets.only(left: 16),
    this.hintTextColor = const Color(0xFF999999),
    this.hintText,
    this.hintTextFontSize = 14.0,
    this.autofocus = false,
    this.keyboardType,
    this.inputFormatters,
    this.onTextChanged,
    this.tapOutSideToHideKeyboard = false,
    this.onComplatedToUnfocus = true,
    this.unfocusOnKeyboardDismiss = false,
    this.closeIconMargin = const EdgeInsets.only(left: 8, right: 16),
    this.rightCustomWidget,
    this.style,
    this.hintStyle,
  });

  final TextEditingController textController;
  final GlobalKey? wrapWidgetKey;
  final EdgeInsetsGeometry padding;
  final Color? hintTextColor;
  final String? hintText;
  final double? hintTextFontSize;
  final bool autofocus;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onTextChanged;
  final bool tapOutSideToHideKeyboard;
  final bool onComplatedToUnfocus;

  /// 键盘收起后是否主动释放焦点，默认为false
  final bool unfocusOnKeyboardDismiss;

  /// 关闭图标margin
  final EdgeInsetsGeometry? closeIconMargin;

  /// 右侧自定义控件
  final Widget? rightCustomWidget;

  final TextStyle? style;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final haveContent = useState(textController.text.isNotEmpty);
    final focusNode = useFocusNode();

    focusNode.addListener(() {
      if (focusNode.hasFocus && textController.text.isNotEmpty) {
        haveContent.value = true;
      } else if (!focusNode.hasFocus) {
        haveContent.value = false;
      }
    });

    // 键盘状态监听 - 只有当unfocusOnKeyboardDismiss为true时才监听
    final keyboardHeight =
        unfocusOnKeyboardDismiss ? ref.watch(keyboardHeightProvider) : 0.0;
    final previousKeyboardHeight = useRef<double>(0.0);

    useEffect(() {
      if (!unfocusOnKeyboardDismiss) return null;

      // 当键盘从显示状态变为隐藏状态时，释放焦点
      if (previousKeyboardHeight.value > 0 &&
          keyboardHeight == 0 &&
          focusNode.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          focusNode.unfocus();
        });
      }

      previousKeyboardHeight.value = keyboardHeight;
      return null;
    }, [keyboardHeight, unfocusOnKeyboardDismiss]);

    return Row(
      children: [
        Expanded(
          // Todo DarrenYou 点击外部需要释放掉焦点
          child: CupertinoTextField(
            autofocus: autofocus,
            focusNode: focusNode,
            padding: padding,
            cursorRadius: const Radius.circular(0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            style: style ??
                TextStyle(
                  fontSize: 16,
                  color: context.appColors.textMain,
                ),
            placeholder: hintText,
            placeholderStyle: hintStyle ??
                TextStyle(
                  color: hintTextColor,
                  fontSize: hintTextFontSize,
                ),
            controller: textController,
            onChanged: (value) {
              onTextChanged?.call(value);
              haveContent.value = value.isNotEmpty;
            },
            onEditingComplete: () {
              if (focusNode.hasFocus && onComplatedToUnfocus) {
                focusNode.unfocus();
              }
            },
            onTapOutside: (event) {
              if (focusNode.hasFocus && tapOutSideToHideKeyboard) {
                // 如果提供了wrapWidgetKey，使用外层组件的范围进行检测
                if (wrapWidgetKey != null) {
                  final RenderBox? wrapRenderBox = wrapWidgetKey!.currentContext
                      ?.findRenderObject() as RenderBox?;
                  if (wrapRenderBox != null) {
                    final wrapLocalPosition =
                        wrapRenderBox.globalToLocal(event.position);
                    final wrapArea = Rect.fromLTWH(
                      0,
                      0,
                      wrapRenderBox.size.width,
                      wrapRenderBox.size.height,
                    );
                    // 如果点击的不在外层组件区域内，才隐藏键盘
                    if (!wrapArea.contains(wrapLocalPosition)) {
                      focusNode.unfocus();
                    }
                  } else {
                    focusNode.unfocus();
                  }
                } else {
                  // 回退到原来的逻辑：检查点击位置是否在清除按钮区域内
                  final RenderBox? renderBox =
                      context.findRenderObject() as RenderBox?;
                  if (renderBox != null) {
                    final localPosition =
                        renderBox.globalToLocal(event.position);
                    final clearButtonArea = Rect.fromLTWH(
                      renderBox.size.width - 44, // 清除按钮宽度44
                      0,
                      44,
                      renderBox.size.height,
                    );
                    // 如果点击的不是清除按钮区域，才隐藏键盘
                    if (!clearButtonArea.contains(localPosition)) {
                      focusNode.unfocus();
                    }
                  } else {
                    focusNode.unfocus();
                  }
                }
              }
            },
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
          ),
        ),
        haveContent.value && focusNode.hasFocus
            ? CustomContainer(
                boxShape: BoxShape.circle,
                scale: false,
                color: Colors.transparent,
                margin: closeIconMargin,
                onTap: () {
                  textController.clear();
                  onTextChanged?.call('');
                  haveContent.value = false;
                },
                child: UnconstrainedBox(
                  child: SvgPicture.asset(
                    Assets.svg.iconClose,
                    width: 20,
                  ),
                ),
              )
            : SizedBox(width: 16),
        rightCustomWidget != null ? rightCustomWidget! : SizedBox(),
      ],
    );
  }
}
