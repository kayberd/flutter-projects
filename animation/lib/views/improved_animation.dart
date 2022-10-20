import 'dart:math';

import 'package:animation/components/blue_square.dart';
import 'package:flutter/material.dart';

class ImprovedAnimation extends StatefulWidget {
  const ImprovedAnimation() : super();

  @override
  State<ImprovedAnimation> createState() => _ImprovedAnimationState();
}

class _ImprovedAnimationState extends State<ImprovedAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(seconds: 5), vsync: this);

    final _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOut
    );

    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_curvedAnimation)
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            _animationController.reverse();
            break;
          case AnimationStatus.dismissed:
            _animationController.forward();
            break;
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
        angle: _animation.value,
        child: const Center(child: BlueLine()),
      ),
    );
  }
}
