import 'dart:math';

import 'package:animation/components/blue_square.dart';
import 'package:flutter/material.dart';

class BasicAnimation extends StatefulWidget {
  const BasicAnimation() : super();

  @override
  State<BasicAnimation> createState() => _BasicAnimationState();
}

class _BasicAnimationState extends State<BasicAnimation> {
  double _angle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
        angle: _angle,
        child: const Center(child: BlueSquare()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _angle += pi/4.0; // 90 Degree
        }),
        child: const Icon(Icons.rotate_90_degrees_ccw),
      ),
    );
  }
}
