import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:video_player/video_player.dart';

class SmoothVideoProgress extends HookWidget {
  const SmoothVideoProgress({
    super.key,
    required this.controller,
    required this.builder,
    this.child,
  });

  final VideoPlayerController controller;
  final Widget Function(BuildContext context, Duration progress,
      Duration duration, Widget? child) builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final value = useValueListenable(controller);
    final animationController = useAnimationController(
        duration: value.duration, keys: [value.duration]);

    final targetRelativePosition =
        value.position.inMilliseconds / value.duration.inMilliseconds;

    final currentPosition = Duration(
        milliseconds:
            (animationController.value * value.duration.inMilliseconds)
                .round());

    final offset = value.position - currentPosition;

    useValueChanged(
      value.position,
      (_, __) {
        final correct = value.isPlaying &&
            offset.inMilliseconds > -500 &&
            offset.inMilliseconds < -50;
        final correction = const Duration(milliseconds: 500) - offset;
        final targetPos =
            correct ? animationController.value : targetRelativePosition;
        final duration = correct ? value.duration + correction : value.duration;

        animationController.duration = duration;
        value.isPlaying
            ? animationController.forward(from: targetPos)
            : animationController.value = targetRelativePosition;
        return true;
      },
    );

    useValueChanged(
      value.isPlaying,
      (_, __) => value.isPlaying
          ? animationController.forward(from: targetRelativePosition)
          : animationController.stop(),
    );

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final millis =
            animationController.value * value.duration.inMilliseconds;
        return builder(
          context,
          Duration(milliseconds: millis.round()),
          value.duration,
          child,
        );
      },
      child: child,
    );
  }
}
