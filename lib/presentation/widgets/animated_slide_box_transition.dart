import 'package:aerium/presentation/widgets/animated_slide_box.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

import 'animated_slide_transtion.dart';

class AnimatedSlideBoxTransition extends AnimatedWidget {
  const AnimatedSlideBoxTransition({
    Key? key,
    required this.controller,
    required this.height,
    required this.width,
    required this.child,
    this.visibleBoxAnimation,
    this.invisibleBoxAnimation,
    this.position,
    this.boxColor = AppColors.black,
    this.coverColor = AppColors.primaryColor,
    this.visibleAnimationcurve = Curves.fastOutSlowIn,
    this.invisibleAnimationcurve = Curves.fastOutSlowIn,
    this.slideAnimationcurve = Curves.fastOutSlowIn,
  }) : super(key: key, listenable: controller);

  final AnimationController controller;
  final double height;
  final double width;
  final Color boxColor;
  final Color coverColor;
  final Animation<double>? visibleBoxAnimation;
  final Animation<double>? invisibleBoxAnimation;
  final Animation<Offset>? position;
  final Curve visibleAnimationcurve;
  final Curve invisibleAnimationcurve;
  final Curve slideAnimationcurve;
  final Widget child;

  Animation<double> get visibleAnimation =>
      visibleBoxAnimation ??
      Tween<double>(begin: 0, end: width).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0, 0.4, curve: visibleAnimationcurve),
        ),
      );
  Animation<double> get invisibleAnimation =>
      Tween<double>(begin: 0, end: width).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.4, 0.8, curve: invisibleAnimationcurve),
        ),
      );

  Animation<Offset> get slideAnimation =>
      position ??
      Tween<Offset>(
        begin: Offset(0, 1),
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.7, 1.0, curve: invisibleAnimationcurve),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Stack(
        children: [
          AnimatedSlideBox(
            controller: controller,
            height: height,
            width: width,
            visibleBoxAnimation: visibleAnimation,
            invisibleBoxAnimation: invisibleAnimation,
          ),
           AnimatedSlideTranstion(
            controller: controller,
            position: slideAnimation,
            child: child,
          ),
        ],
      ),
    );
  }
}
