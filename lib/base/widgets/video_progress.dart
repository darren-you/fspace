import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// 自定义Video进度条
class VideoProgress extends HookWidget {
  const VideoProgress({
    super.key,
    required this.progress,
    this.onChanged,
    this.enableDrag = true,
    this.onDragUpdate,
    this.margin,
  });

  final double progress;
  final ValueChanged<double>? onChanged;
  final bool enableDrag;
  final ValueChanged<double>? onDragUpdate;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final isDraging = useState(false);
    final dragProgress = useState(0.0);
    final offset = useRef(0.0);
    final startOffset = useRef<double?>(null);
    final displayProgress = isDraging.value ? dragProgress.value : progress;

    return LayoutBuilder(
      builder: (context, constraints) {
        // final maxWidth = constraints.maxWidth - 8 - 28;
        final maxWidth = constraints.maxWidth;
        return GestureDetector(
          onHorizontalDragStart: enableDrag && onChanged != null
              ? (details) {
                  isDraging.value = true;
                  startOffset.value = details.localPosition.dx;
                }
              : null,
          onHorizontalDragUpdate: enableDrag && onChanged != null
              ? (details) {
                  if (startOffset.value != null) {
                    offset.value = startOffset.value!;
                    startOffset.value = null;
                  }
                  var newOffset = offset.value + details.delta.dx;
                  if (newOffset < 0) {
                    newOffset = 0;
                  } else if (newOffset > maxWidth) {
                    newOffset = maxWidth;
                  }
                  offset.value = newOffset;
                  dragProgress.value = newOffset / maxWidth;
                  onDragUpdate?.call(dragProgress.value);
                }
              : null,
          behavior: HitTestBehavior.opaque,
          onHorizontalDragEnd: enableDrag && onChanged != null
              ? (details) {
                  isDraging.value = false;
                  onChanged?.call(dragProgress.value);
                }
              : null,
          onHorizontalDragCancel: enableDrag && onChanged != null ? () => isDraging.value = false : null,
          child: Container(
            margin: margin,
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: isDraging.value ? 12 : 6,
                  padding: EdgeInsets.symmetric(vertical: 1),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Container(
                          color: Colors.white.withValues(alpha: 0.4),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: maxWidth * displayProgress,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.white.withValues(alpha: 0.8)],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: max(0, maxWidth * displayProgress - 3)),
                  child: Container(
                    width: 6,
                    height: isDraging.value ? 12 : 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
