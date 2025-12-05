import 'package:flutter/material.dart';

class BounceMarqueeText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final double maxWidth;
  final Curve curve;

  const BounceMarqueeText({
    super.key,
    required this.text,
    this.style,
    required this.maxWidth,
    this.curve = Curves.linear,
  });

  @override
  BounceMarqueeTextState createState() => BounceMarqueeTextState();
}

class BounceMarqueeTextState extends State<BounceMarqueeText>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late TextPainter _textPainter;
  bool _needMarquee = false;

  @override
  void initState() {
    super.initState();

    _needMarquee = _checkTextOverflow();
    if (_needMarquee) {
      final time = ((_textPainter.width - widget.maxWidth) * 100).truncate();
      _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: time), // 增加一点时间以便来回滚动
      )..addListener(() => setState(() {}));
      _controller?.repeat(reverse: true); // 来回滚动
    }
  }

  bool _checkTextOverflow() {
    _textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: double.infinity);
    // 检查文本是否超出最大宽度
    return _textPainter.width > widget.maxWidth;
  }

  @override
  void didUpdateWidget(covariant BounceMarqueeText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text ||
        oldWidget.maxWidth != widget.maxWidth) {
      _checkTextOverflow();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_needMarquee) {
      return Text(
        widget.text,
        style: widget.style,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    }

    final textWidth = _textPainter.width;
    final containerWidth = widget.maxWidth;
    final maxOffset = textWidth - containerWidth;

    final offset = Tween<double>(begin: 0, end: maxOffset)
        .animate(CurvedAnimation(parent: _controller!, curve: widget.curve))
        .value;

    return SizedBox(
      width: containerWidth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: -offset,
            child: Text(
              widget.text,
              style: widget.style,
            ),
          ),
        ],
      ),
    );
  }
}
