import 'package:flutter/material.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';

class CustomScroller extends StatelessWidget {
  CustomScroller({
    this.width = Sizes.WIDTH_24,
    this.height = Sizes.HEIGHT_70,
    this.padding = const EdgeInsets.all(Sizes.PADDING_0),
    this.scrollColor = AppColors.primaryColor,
    this.scrollCenterColor = AppColors.secondaryColor,
    this.duration = 800,
    this.borderRadius = Sizes.RADIUS_20,
    this.onUpTap,
    this.onDownTap,
    this.topController,
    this.centerChild,
    this.bottomController,
  });

  final EdgeInsetsGeometry padding;
  final double width;
  final int duration;
  final double height;
  final double borderRadius;
  final Color scrollColor;
  final Color scrollCenterColor;
  final GestureTapCallback? onUpTap;
  final GestureTapCallback? onDownTap;
  final Widget? topController;
  final Widget? bottomController;
  final Widget? centerChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: height),
        duration: Duration(milliseconds: duration),
        child: Column(
          children: [
            InkWell(
              onTap: onUpTap,
              child: topController ??
                  Icon(Icons.keyboard_arrow_up,
                      color: AppColors.secondaryColor),
            ),
            SpaceH8(),
            centerChild ??
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    width: Sizes.WIDTH_6,
                    height: Sizes.HEIGHT_6,
                    color: scrollCenterColor,
                  ),
                ),
            SpaceH8(),
            InkWell(
              onTap: onDownTap,
              child: bottomController ??
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.secondaryColor,
                  ),
            )
          ],
        ),
        builder: (BuildContext context, double value, Widget? child) {
          return Container(
            width: width,
            height: value,
            color: scrollColor,
            child: child,
          );
        },
      ),
    );
  }
}
