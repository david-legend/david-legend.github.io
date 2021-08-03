import 'package:flutter/material.dart';

class AnimatedSlideTranstion extends AnimatedWidget {
  AnimatedSlideTranstion({
    Key? key,
    required this.controller,
    required this.child,
    this.position,
    this.curve = Curves.ease,
  }) : super(key: key, listenable: controller);

  final AnimationController controller;
  final Animation<Offset>? position;
  final Curve curve;
  final Widget child;

  Animation<Offset> get animation =>
      position ??
      Tween<Offset>(
        begin: Offset(0, 1),
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: curve,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: child,
    );
  }
}
