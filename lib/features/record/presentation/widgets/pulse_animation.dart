library pulse_animation.dart;

/// Uses fade animation to 'pulse'/'flicker' a widget.
/// [child] - Widget to apply pulse to
/// [duration] - Duration of pulse from low to bright and back to low (default: [Duration(milliseconds 1500)])
/// [tween] - Tween<double> of (0.0 to 1.0) for the pulse alpha (default: [Tween(begin: 0.25, end: 1.0)])
import 'package:flutter/material.dart';

class PulseAnimation extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  final Tween<double>? tween;

  const PulseAnimation({super.key, required this.child, this.duration, this.tween});

  @override
  _PulseAnimation createState() => _PulseAnimation();
}

class _PulseAnimation extends State<PulseAnimation> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late Duration _duration;
  late Tween<double> _tween;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tween = widget.tween ?? Tween(begin: 0.25, end: 1.0);
    _duration = widget.duration ?? const Duration(milliseconds: 1500);
    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );
    final CurvedAnimation curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    );
    _animation = _tween.animate(curve);
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
