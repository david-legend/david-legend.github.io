import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

import 'empty.dart';

class AnimatedSlideBox extends StatefulWidget {
  const AnimatedSlideBox({
    Key? key,
    required this.width,
    required this.height,
    required this.controller,
    this.duration = const Duration(milliseconds: 3000),
    this.boxColor = AppColors.black,
    this.curve = Curves.fastOutSlowIn,
  }) : super(key: key);

  final double width;
  final double height;
  final Color boxColor;
  final Duration duration;
  final Curve curve;
  final AnimationController controller;

  @override
  _AnimatedSlideBoxState createState() => _AnimatedSlideBoxState();
}

class _AnimatedSlideBoxState extends State<AnimatedSlideBox> {
  late Animation<double> visibleBoxAnimation;
  late Animation<double> visibleBoxOpacityAnimation;
  late Animation<double> invisibleBoxAnimation;
  late Animation<Color?> invisibleBoxColorAnimation;
  late Color visibleBoxColor;
   Color invisibleBoxColor = Colors.transparent;
  //  bool start = false;

  @override
  void initState() {
    super.initState();
    visibleBoxColor = widget.boxColor;
    visibleBoxAnimation = Tween<double>(begin: 0, end: widget.width).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(0, 0.4, curve: widget.curve),
      ),
    );
    visibleBoxOpacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(0.4, 0.5, curve: widget.curve),
      ),
    );
    invisibleBoxColorAnimation = ColorTween(begin:Colors.transparent, end:  widget.boxColor).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(0.4, 0.6, curve: widget.curve),
      ),
    );
    invisibleBoxAnimation = Tween<double>(begin: widget.width, end: 0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(0.6, 1.0, curve: widget.curve),
      ),
    );
    
    
    // visibleBoxAnimation.addStatusListener((status) {
    //   if(status == AnimationStatus.completed) {
    //     setState(() {
    //       visibleBoxColor = Colors.transparent;
    //       start = true;
    //       // invisibleBoxColor = widget.boxColor;
    //     });
    //   }
    // });
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          // Text(
          //   "GET IN TOUCH",
          //   style: textTheme.headline2?.copyWith(
          //     color: AppColors.black,
          //     fontSize: 60,
          //   ),
          // ),
          Positioned(
            right: 0,
            child: Container(
              width: invisibleBoxAnimation.value,
              height: widget.height,
              color: invisibleBoxColorAnimation.value,
            ),
          ) ,
          Positioned(
            left: 0,
            child: Opacity(
              opacity: visibleBoxOpacityAnimation.value,
              child: Container(
                width: visibleBoxAnimation.value,
                height: widget.height,
                color: visibleBoxColor,
              ),
            ),
          ),
          
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: widget.controller,
    );
  }
}
