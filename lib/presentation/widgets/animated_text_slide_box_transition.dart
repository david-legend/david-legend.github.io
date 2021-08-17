import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/widgets/animated_slide_box.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AnimatedTextSlideBoxTransition extends StatefulWidget {
  const AnimatedTextSlideBoxTransition({
    Key? key,
    required this.controller,
    required this.text,
    required this.textStyle,
    this.width = double.infinity,
    this.maxLines = 1,
    this.widthFactor = 1,
    this.heightFactor = 1,
    this.visibleBoxAnimation,
    this.invisibleBoxAnimation,
    this.position,
    this.textAlign,
    this.boxColor = AppColors.black,
    this.coverColor = AppColors.primaryColor,
    this.visibleAnimationcurve = Curves.fastOutSlowIn,
    this.invisibleAnimationcurve = Curves.fastOutSlowIn,
    this.slideAnimationcurve = Curves.fastOutSlowIn,
  }) : super(key: key);

  final AnimationController controller;
  final double heightFactor;
  final double widthFactor;
  final Color boxColor;
  final Color coverColor;
  final Animation<double>? visibleBoxAnimation;
  final Animation<double>? invisibleBoxAnimation;
  final Animation<Offset>? position;
  final Curve visibleAnimationcurve;
  final Curve invisibleAnimationcurve;
  final Curve slideAnimationcurve;
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double width;
  final int maxLines;

  @override
  _AnimatedTextSlideBoxTransitionState createState() =>
      _AnimatedTextSlideBoxTransitionState();
}

class _AnimatedTextSlideBoxTransitionState
    extends State<AnimatedTextSlideBoxTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> visibleAnimation;
  late Animation<double> invisibleAnimation;
  late Animation<RelativeRect> textPositionAnimation;
  late Size size;
  late double textWidth;
  late double textHeight;

  @override
  void initState() {
    setTextWidthAndHeight();
    controller = widget.controller;
    visibleAnimation = widget.visibleBoxAnimation ??
        Tween<double>(begin: 0, end: textWidth).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0,
              0.35,
              curve: widget.visibleAnimationcurve,
            ),
          ),
        );

    invisibleAnimation = widget.invisibleBoxAnimation ??
        Tween<double>(begin: 0, end: textWidth).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.35,
              0.7,
              curve: widget.invisibleAnimationcurve,
            ),
          ),
        );

    textPositionAnimation = RelativeRectTween(
      begin: RelativeRect.fromSize(
        Rect.fromLTWH(0, textHeight, textWidth, textHeight),
        Size(textWidth, textHeight),
      ),
      end: RelativeRect.fromSize(
        Rect.fromLTWH(0, 0, textWidth, textHeight),
        Size(textWidth, textHeight),
      ),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.6, 1.0, curve: widget.invisibleAnimationcurve),
      ),
    );

    super.initState();
  }

  void setTextWidthAndHeight() {
    size = Functions.textSize(
      text: widget.text,
      style: widget.textStyle,
      maxWidth: widget.width,
      maxLines: widget.maxLines,
    );
    textWidth = size.width * widget.widthFactor;
    textHeight = size.height * widget.heightFactor;
  }

  @override
  Widget build(BuildContext context) {
    setTextWidthAndHeight();

    return Container(
      height: textHeight,
      child: Stack(
        children: [
          AnimatedSlideBox(
            controller: widget.controller,
            height: textHeight,
            width: textWidth,
            coverColor: widget.coverColor,
            boxColor: widget.boxColor,
            visibleBoxAnimation: visibleAnimation,
            invisibleBoxAnimation: invisibleAnimation,
          ),
          PositionedTransition(
            rect: textPositionAnimation,
            child: Text(
              widget.text,
              style: widget.textStyle,
              textAlign: widget.textAlign,
            ),
          ),
        ],
      ),
    );
  }
}
