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
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_animationController)..addListener(() => setState(() {}));
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
