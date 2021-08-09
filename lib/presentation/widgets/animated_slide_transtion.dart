import 'package:flutter/material.dart';

class AnimatedSlideTranstion extends AnimatedWidget {
  AnimatedSlideTranstion({
    Key? key,
    required this.controller,
    required this.child,
    this.position,
    this.beginOffset = const Offset(0, 1),
    this.targetOffset = const Offset(0, 0),
    this.curve = Curves.ease,
    this.hasHoverTransition = false,
  }) : super(key: key, listenable: controller);

  final AnimationController controller;
  final Animation<Offset>? position;
  final Offset beginOffset;
  final Offset targetOffset;
  final Curve curve;
  final bool hasHoverTransition;
  final Widget child;

  Animation<Offset> get animation =>
      position ??
      Tween<Offset>(
        begin: beginOffset,
        end: targetOffset,
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
