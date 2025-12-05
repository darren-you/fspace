import 'dart:math' as math;

import 'package:flutter/material.dart';

class SpringCurve extends Curve {
  late final double _mW0;
  late final double _mZeta;
  late final double _mWd;
  late final double _mA;
  late final double _mB;

  /// Creates a [FigmaSpringCurve] curve
  SpringCurve(
    double mass,
    double stiffness,
    double damping, [
    double initialVelocity = 0.5,
  ]) {
    _mW0 = math.sqrt(stiffness / mass);
    _mZeta = damping / (2 * math.sqrt(stiffness * mass));

    if (_mZeta < 1) {
      // Under-damped.
      _mWd = _mW0 * math.sqrt(1 - _mZeta * _mZeta);
      _mA = 1;
      _mB = (_mZeta * _mW0 + -initialVelocity) / _mWd;
    } else {
      // Critically damped (ignoring over-damped case for now).
      _mA = 1;
      _mB = -initialVelocity + _mW0;
    }
  }

  @override
  double transformInternal(double t) {
    if (_mZeta < 1) {
      // Under-damped
      t = math.exp(-t * _mZeta * _mW0) * (_mA * math.cos(_mWd * t) + _mB * math.sin(_mWd * t));
    } else {
      // Critically damped (ignoring over-damped case for now).
      t = (_mA + _mB * t) * math.exp(-t * _mW0);
    }

    // Map range from [1..0] to [0..1].
    return 1 - t;
  }

  /// Gentle spring curve
  static SpringCurve gentle = _GentleSpringCurve();

  /// Quick spring curve
  static SpringCurve quick = _QuickSpringCurve();

  /// Bouncy spring curve
  static SpringCurve bouncy = _BouncySpringCurve();

  /// Slow spring curve
  static SpringCurve slow = _SlowSpringCurve();
}

class _GentleSpringCurve extends SpringCurve {
  _GentleSpringCurve() : super(1, 100, 15);
}

class _QuickSpringCurve extends SpringCurve {
  _QuickSpringCurve() : super(1, 300, 20);
}

class _BouncySpringCurve extends SpringCurve {
  _BouncySpringCurve() : super(1, 600, 15);
}

class _SlowSpringCurve extends SpringCurve {
  _SlowSpringCurve() : super(1, 80, 20);
}
