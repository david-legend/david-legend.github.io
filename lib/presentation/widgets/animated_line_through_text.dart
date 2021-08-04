import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AnimatedLineThroughText extends StatefulWidget {
  const AnimatedLineThroughText({
    Key? key,
    required this.text,
    required this.textStyle,
    this.onHoverTextStyle,
    this.lineThickness = 2,
    this.hoverColor = AppColors.black,
    this.coverColor = AppColors.primaryColor,
    this.onTap,
    this.isUnderlined = true,
    this.hasOffsetAnimation = false,
    this.duration = const Duration(milliseconds: 300),
    this.beginOffset = const Offset(0, 0),
    this.endOffset = const Offset(0.15, 0),
  }) : super(key: key);

  final String text;
  final Duration duration;
  final Color hoverColor;
  final Color coverColor;
  final double lineThickness;
  final TextStyle? textStyle;
  final TextStyle? onHoverTextStyle;
  final bool isUnderlined;
  final bool hasOffsetAnimation;
  final Offset beginOffset;
  final Offset endOffset;
  final GestureTapCallback? onTap;

  @override
  _AnimatedLineThroughTextState createState() =>
      _AnimatedLineThroughTextState();
}

class _AnimatedLineThroughTextState extends State<AnimatedLineThroughText>
    with TickerProviderStateMixin {
  late AnimationController _forwardController;
  late AnimationController _backwardsController;
  late AnimationController _slideTransitionController;
  late Animation<double> forwardAnimation;
  late Animation<double> backwardsAnimation;
  late Animation<Offset> _offsetAnimation;
  late double textWidth;
  late double textHeight;
  bool _isHovering = false;

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

    _slideTransitionController = AnimationController(
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

    _offsetAnimation = 
        Tween<Offset>(
          begin: widget.beginOffset,
          end: widget.hasOffsetAnimation ? widget.endOffset : widget.beginOffset,
        ).animate(
          CurvedAnimation(
            parent: _slideTransitionController,
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

    TextStyle? hoverTextStyle =  widget.onHoverTextStyle ?? widget.textStyle;
    return InkWell(
      onTap: widget.onTap,
      hoverColor: Colors.transparent,
      child: MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: SlideTransition(
          position: _offsetAnimation,
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
                style: _isHovering
                    ? hoverTextStyle?.copyWith(
                        decoration: widget.isUnderlined
                            ? TextDecoration.underline
                            : TextDecoration.none,
                      )
                    : widget.textStyle,
              ),
            ],
          ),
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
        _slideTransitionController.forward();
        _forwardController.forward();
        _isHovering = hovering;
      });
    } else {
      setState(() {
        _slideTransitionController.reverse();
        _backwardsController.forward();
        _isHovering = hovering;
      });
    }
  }
}
