import 'package:flutter/material.dart';

class AnimatedPositionedText extends StatefulWidget {
  const AnimatedPositionedText({
    Key? key,
    required this.controller,
    required this.text,
    required this.textStyle,
    this.factor = 1.25,
    this.textAlign,
    this.relativeRect,
    this.slideAnimationcurve = Curves.fastOutSlowIn,
  }) : super(key: key);

  final CurvedAnimation controller;
  final String text;
  final double factor;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Animation<RelativeRect>? relativeRect;
  final Curve slideAnimationcurve;

  @override
  _AnimatedPositionedTextState createState() => _AnimatedPositionedTextState();
}

class _AnimatedPositionedTextState extends State<AnimatedPositionedText> {
  late Animation<RelativeRect> textPositionAnimation;
  late Size size;
  late double textWidth;
  late double textHeight;

  @override
  void initState() {
    setTextWidthAndHeight();

    textPositionAnimation = widget.relativeRect ??
        RelativeRectTween(
          begin: RelativeRect.fromSize(
            Rect.fromLTWH(0, textHeight, textWidth, textHeight),
            Size(textWidth, textHeight),
          ),
          end: RelativeRect.fromSize(
            Rect.fromLTWH(0, 0, textWidth, textHeight),
            Size(textWidth, textHeight),
          ),
        ).animate(widget.controller);

    super.initState();
  }

  void setTextWidthAndHeight() {
    size = _textSize(widget.text, widget.textStyle);
    textWidth = size.width;
    textHeight = size.height * widget.factor;
  }

  @override
  Widget build(BuildContext context) {
    setTextWidthAndHeight();

    return Container(
      height: textHeight,
      child: Stack(
        children: [
          PositionedTransition(
            rect: textPositionAnimation,
            child: Text(
              widget.text,
              textAlign: widget.textAlign,
              style: widget.textStyle,
            ),
          ),
        ],
      ),
    );
  }

  Size _textSize(String text, TextStyle? style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        // maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
