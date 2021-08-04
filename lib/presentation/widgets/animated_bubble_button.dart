import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AnimatedBubbleButton extends StatefulWidget {
  const AnimatedBubbleButton({
    Key? key,
    required this.child,
    this.startWidth = 50,
    this.height = 50,
    this.targetWidth = 150,
    this.startBorderRadius = const BorderRadius.all(Radius.circular(80.0)),
    this.endBorderRadius,
    this.curve = Curves.fastOutSlowIn,
    this.color = AppColors.black100,
    this.offsetAnimation,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  final double height;
  final double startWidth;
  final double targetWidth;
  final Color color;
  final Curve curve;
  final Duration duration;
  final Widget child;
  final BorderRadiusGeometry startBorderRadius;
  final BorderRadiusGeometry? endBorderRadius;
  final Animation<Offset>? offsetAnimation;

  @override
  _AnimatedBubbleButtonState createState() => _AnimatedBubbleButtonState();
}

class _AnimatedBubbleButtonState extends State<AnimatedBubbleButton>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offsetAnimation = widget.offsetAnimation ??
        Tween<Offset>(
          begin: Offset(0, 0),
          end: Offset(0.1, 0),
        ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          width: widget.targetWidth,
          height: widget.height,
          child: Stack(
            children: [
              Positioned(
                child: AnimatedContainer(
                  duration: widget.duration,
                  width: _isHovering ? widget.targetWidth : widget.startWidth,
                  alignment: Alignment.centerLeft,
                  height: widget.height,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: _isHovering
                        ? (widget.endBorderRadius ?? widget.startBorderRadius)
                        : widget.startBorderRadius,
                  ),
                ),
              ),
              Positioned(
                top: widget.height / 3,
                width: widget.targetWidth,
                child: Center(
                  child: widget.child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        _isHovering = hovering;
        _controller.forward();
      });
    } else {
      setState(() {
        _isHovering = hovering;
        _controller.reverse();
      });
    }
  }
}
