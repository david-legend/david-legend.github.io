import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AnimatedUnderlineText extends StatefulWidget {
  const AnimatedUnderlineText({
    Key? key,
    required this.text,
    required this.textStyle,
    this.lineThickness = 2,
    this.hoverColor = AppColors.black,
    this.coverColor = AppColors.primaryColor,
    this.onTap,
    this.duration = const Duration(milliseconds: 300),
  }) : super(key: key);

  final String text;
  final Duration duration;
  final Color hoverColor;
  final Color coverColor;
  final double lineThickness;
  final TextStyle? textStyle;
  final GestureTapCallback? onTap;

  @override
  _AnimatedUnderlineTextState createState() => _AnimatedUnderlineTextState();
}

class _AnimatedUnderlineTextState extends State<AnimatedUnderlineText>
    with TickerProviderStateMixin {
  late AnimationController _forwardController;
  late AnimationController _backwardsController;
  late Animation<double> forwardAnimation;
  late Animation<double> backwardsAnimation;
  bool _isHovering = false;
  late double textWidth;
  late double textHeight;

  @override
  void initState() {
    textWidth = _textSize(widget.text, widget.textStyle).width;
    textHeight = _textSize(widget.text, widget.textStyle).height;
    _forwardController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addListener(() {
        setState(() {});
      });
    _backwardsController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addListener(() {
        setState(() {});
      });
    forwardAnimation = Tween<double>(begin: 0, end: textWidth).animate(
      CurvedAnimation(
        parent: _forwardController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    backwardsAnimation = Tween<double>(begin: 0, end: textWidth).animate(
      CurvedAnimation(
        parent: _backwardsController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _backwardsController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _backwardsController.reset();
        _forwardController.reset();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      hoverColor: Colors.transparent,
      child: MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: Stack(
          children: [
            Positioned(
              top: (textHeight / 2) - widget.lineThickness,
              child: Container(
                height: widget.lineThickness,
                color: widget.hoverColor,
                width: forwardAnimation.value,
              ),
            ),
            Positioned(
              top: (textHeight / 2) - widget.lineThickness,
              child: Container(
                height: widget.lineThickness,
                color: widget.coverColor,
                width: backwardsAnimation.value,
              ),
            ),
            Text(
              widget.text,
              style: widget.textStyle?.copyWith(
                decoration: _isHovering
                    ? TextDecoration.none
                    : TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Size _textSize(String text, TextStyle? style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        _forwardController.forward();
        _isHovering = hovering;
      });
    } else {
      setState(() {
        _backwardsController.forward();
        _isHovering = hovering;
      });
    }
  }
}
