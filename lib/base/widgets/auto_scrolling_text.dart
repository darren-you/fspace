import 'dart:async';
import 'package:flutter/material.dart';

/// 自动循环切换文本组件
///
/// 特性：
/// - 每次显示一个关键词，停留3秒后切换到下一个
/// - 支持多个关键词的自动循环切换
/// - 支持自定义文本样式和切换间隔
/// - 支持占位文本显示
class AnimSwitcherText extends StatefulWidget {
  /// 关键词列表
  final List<String>? keywords;

  /// 文本样式
  final TextStyle? style;

  /// 占位文本，当keywords为空时显示
  final String placeholder;

  /// 每个关键词的显示时间（秒）
  final Duration displayDuration;

  /// 文本区域宽度
  final double? width;

  const AnimSwitcherText({
    super.key,
    this.keywords,
    this.style,
    required this.placeholder,
    this.displayDuration = const Duration(seconds: 3),
    this.width,
  });

  @override
  State<AnimSwitcherText> createState() => _AutoScrollingTextState();
}

class _AutoScrollingTextState extends State<AnimSwitcherText> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (widget.keywords != null && widget.keywords!.length > 1) {
      _timer = Timer.periodic(widget.displayDuration, (timer) {
        if (mounted) {
          setState(() {
            _currentIndex = (_currentIndex + 1) % widget.keywords!.length;
          });
        }
      });
    }
  }

  @override
  void didUpdateWidget(AnimSwitcherText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.keywords != widget.keywords ||
        oldWidget.displayDuration != widget.displayDuration) {
      _timer?.cancel();
      _currentIndex = 0;
      _startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    // 如果没有关键词，显示占位文本
    if (widget.keywords == null || widget.keywords!.isEmpty) {
      return _buildText(widget.placeholder);
    }

    // 显示当前索引对应的关键词
    final currentText = widget.keywords![_currentIndex];
    return _buildText(currentText);
  }

  /// 构建文本显示
  Widget _buildText(String text) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          alignment: Alignment.centerLeft, // 确保动画过程中始终左对齐
          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
      child: Text(
        text,
        key: ValueKey(text), // 使用 ValueKey 确保动画正确触发
        style: widget.style,
        maxLines: null,
        overflow: TextOverflow.visible,
        textAlign: TextAlign.left,
      ),
    );
  }
}
