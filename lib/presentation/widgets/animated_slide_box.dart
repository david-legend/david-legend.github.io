import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AnimatedSlideBox extends AnimatedWidget {
  const AnimatedSlideBox({
    Key? key,
    required this.controller,
    required this.height,
    required this.width,
    this.visibleBoxAnimation,
    this.invisibleBoxAnimation,
    this.boxColor = AppColors.black,
    this.coverColor = AppColors.primaryColor,
    this.visibleBoxCurve = Curves.fastOutSlowIn,
    this.invisibleBoxCurve = Curves.fastOutSlowIn,
  }) : super(key: key, listenable: controller);

  final AnimationController controller;
  final double height;
  final double width;
  final Color boxColor;
  final Color coverColor;
  final Curve visibleBoxCurve;
  final Curve invisibleBoxCurve;
  final Animation<double>? visibleBoxAnimation;
  final Animation<double>? invisibleBoxAnimation;

  Animation<double> get visibleAnimation =>
      visibleBoxAnimation ??
      Tween<double>(begin: 0, end: width).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0, 0.5, curve: visibleBoxCurve),
        ),
      );
  Animation<double> get invisibleAnimation =>
      Tween<double>(begin: 0, end: width).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.5, 1.0, curve: invisibleBoxCurve),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: 2,
            child: Container(
              width: visibleAnimation.value,
              height: height - 4,
              color: boxColor,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: invisibleAnimation.value,
              height: height + 4,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
