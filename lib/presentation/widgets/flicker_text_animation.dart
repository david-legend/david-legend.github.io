import 'dart:math';

import 'package:flutter/material.dart';
import 'package:aerium/values/values.dart';

class FlickerTextAnimation extends StatefulWidget {
  FlickerTextAnimation({
    Key? key,
    required this.controller,
    this.textColor,
    this.fadeInColor,
    required this.text,
    this.textStyle,
    this.start,
    this.end,
    this.wrapAlignment = WrapAlignment.start,
    this.fontSize = Sizes.TEXT_SIZE_18,
  })  : color = ColorTween(
          begin: textColor,
          end: fadeInColor,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              start == null ? 0.0 : start,
              end == null ? 1.0 : end,
              curve: Curves.easeIn,
            ),
          ),
        ),
        title = IntTween(
          begin: (Random().nextDouble() * pow(10, text.length)).toInt(),
          end: (Random().nextDouble() * pow(10, text.length)).toInt(),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              start == null ? 0.0 : start,
              end == null ? 1.0 : end,
              curve: Curves.easeIn,
            ),
          ),
        ),
        super(key: key);

  final Animation<double> controller;
  final Animation<Color?> color;
  final Animation<int> title;
  final Color? textColor;
  final Color? fadeInColor;
  final String text;
  final double fontSize;
  final TextStyle? textStyle;

  final double? start;
  final double? end;
  final WrapAlignment wrapAlignment;

  @override
  _FlickerTextAnimationState createState() => _FlickerTextAnimationState();
}

class _FlickerTextAnimationState extends State<FlickerTextAnimation> {
  bool isAnimating = false;

  @override
  void initState() {
    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          setState(() {
            isAnimating = true;
          });
        });
      }
      if (status == AnimationStatus.completed) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          setState(() {
            isAnimating = false;
          });
        });
      }
    });

    super.initState();
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    ThemeData theme = Theme.of(context);
    return Container(
      child: Wrap(
        alignment: widget.wrapAlignment,
        spacing: 0,
        runSpacing: 0,
        children: [
          Text(
            isAnimating ? widget.title.value.toString() : widget.text,
            style: widget.textStyle ??
                theme.textTheme.headline6!.copyWith(
                  color: widget.color.value,
                  fontSize: widget.fontSize,
                ),
          )
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
