import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

const double hiddenFactor = 2.0;

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
      Tween<double>(begin: 0, end: width - (hiddenFactor*2)).animate(
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
    // in this animation, we first animation a black container and later followed by a white box.
    // but because the height and width for both boxes are the same, 
    // we can still see a small part of the black box after the animation
    // to remedy this, i use the variable hidden factor to offset the black box 
    // so that it will be totally hidden by the white box
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: hiddenFactor,
            left: hiddenFactor,
            child: Container(
              width: visibleAnimation.value,
              height: height - (hiddenFactor * 2),
              color: boxColor,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: invisibleAnimation.value,
              height: height ,
              color: coverColor,
            ),
          ),
        ],
      ),
    );
  }
}
