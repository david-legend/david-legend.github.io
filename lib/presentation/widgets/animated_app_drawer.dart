import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AnimatedAppDrawer extends StatefulWidget {
  const AnimatedAppDrawer({
    Key? key,
    required this.controller,
    this.curve = Curves.fastOutSlowIn,
  }) : super(key: key);

  final AnimationController controller;
  final Curve curve;

  @override
  _AnimatedAppDrawerState createState() => _AnimatedAppDrawerState();
}

class _AnimatedAppDrawerState extends State<AnimatedAppDrawer>
    with SingleTickerProviderStateMixin {
  late Animation<double> width1;
  late Animation<double> width2;
  late Animation<double> width3;
  late Animation<double> width4;
  @override
  void initState() {
    width1 = Tween<double>(begin: 0.0, end: 400.0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: widget.curve, //Interval(0, 1, curve: widget.curve),
      ),
    )..addListener(() {
        setState(() {});
      });

    width2 = Tween<double>(begin: 0.0, end: 400.0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve:widget.curve, // Interval(0.1, 1, curve: widget.curve),
      ),
    )..addListener(() {
        setState(() {});
      });

    width3 = Tween<double>(begin: 0.0, end: 400.0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve:widget.curve, // Interval(0.125, 1, curve: widget.curve),
      ),
    )..addListener(() {
        setState(() {});
      });

    width4 = Tween<double>(begin: 0.0, end: 400.0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve:widget.curve, // Interval(0.15, 1, curve: widget.curve),
      ),
    )..addListener(() {
        setState(() {});
      });

widget.controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double screenWidth = widthOfScreen(context);

    return Container(
      // width: screenWidth,
      height: screenHeight,
      // color: AppColors.roamSelectedNavTitle,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: AppColors.black,
            width: width1.value,
            height: screenHeight * 0.25,
          ),
          // Container(
          //   color: AppColors.black,
          //   width: width2.value,
          //   height: screenHeight * 0.25,
          // ),
          // Container(
          //   color: AppColors.black,
          //   width: width3.value,
          //   height: screenHeight * 0.25,
          // ),
          // Container(
          //   color: AppColors.black,
          //   width: width4.value,
          //   height: screenHeight * 0.25,
          // ),
        ],
      ),
    );
  }
}
