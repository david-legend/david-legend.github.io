import 'package:flutter/material.dart';
import 'package:aerium/values/values.dart';

class CircularContainer extends StatelessWidget {
  CircularContainer({
    this.child,
    this.width = Sizes.WIDTH_40,
    this.height = Sizes.HEIGHT_40,
    this.color = AppColors.primaryColor,
    this.borderRadius,
  });

  final Color color;
  final Widget? child;
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(Sizes.RADIUS_60)),
      child: child,
    );
  }
}
