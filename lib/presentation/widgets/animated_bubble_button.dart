import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AnimatedBubbleButton extends StatefulWidget {
  AnimatedBubbleButton({
    Key? key,
    this.child,
    this.title = '',
    this.titleStyle,
    this.startWidth = 50,
    this.height = 50,
    this.targetWidth = 150,
    this.startBorderRadius = const BorderRadius.all(Radius.circular(80.0)),
    this.endBorderRadius,
    this.curve = Curves.easeIn,
    this.color = AppColors.black100,
    this.imageColor = AppColors.accentColor,
    this.offsetAnimation,
    this.duration = const Duration(milliseconds: 300),
    this.onTap,
    this.hovering,
    this.startOffset = const Offset(0, 0),
    this.targetOffset = const Offset(0.1, 0),
    this.controller,
    this.controlsOwnAnimation = true,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final double height;
  final double startWidth;
  final double targetWidth;
  final Color color;
  final Color imageColor;
  final Curve curve;
  final Duration duration;
  final Widget? child;
  final BorderRadiusGeometry startBorderRadius;
  final Animation<Offset>? offsetAnimation;
  final Offset startOffset;
  final Offset targetOffset;
  final GestureTapCallback? onTap;
  final BorderRadiusGeometry? endBorderRadius;
  bool? hovering;
  // prevents button from animating on mouse enter and exit
  bool controlsOwnAnimation;
  final AnimationController? controller;

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
    _controller = widget.controller ??
        AnimationController(
          vsync: this,
          duration: widget.duration,
        );

    _offsetAnimation = widget.offsetAnimation ??
        Tween<Offset>(
          begin: widget.startOffset,
          end: widget.targetOffset,
        ).animate(CurvedAnimation(parent: _controller, curve: widget.curve))
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? buttonStyle = textTheme.bodyText1?.copyWith(
      color: AppColors.accentColor,
      fontSize: Sizes.TEXT_SIZE_16,
      fontWeight: FontWeight.w500,
    );
    // return MouseRegion(
    //   cursor: SystemMouseCursors.click,
    //   child: Link(
    //     uri: Uri.parse('https://creativemaybeno.dev'),
    //     target: LinkTarget.blank,
    //     builder: (context, followLink) {
    //       return GestureDetector(
    //         onTap: followLink,
    //         child: const Text(
    //           'my amazing link',
    //           style: TextStyle(
    //             decoration: TextDecoration.underline,
    //             // The default link color according to the HTML living standard.
    //             // See https://html.spec.whatwg.org/multipage/rendering.html#phrasing-content-3,
    //             // which defines :link { color: #0000EE; }.
    //             color: Color(0xff0000ee),
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
    return MouseRegion(
      onEnter: widget.controlsOwnAnimation ? (e) => _mouseEnter(true) : null,
      onExit: widget.controlsOwnAnimation ? (e) => _mouseEnter(false) : null,
      child: SlideTransition(
        position: _offsetAnimation,
        child: InkWell(
          hoverColor: Colors.transparent,
          onTap: widget.onTap,
          child: Container(
            width: widget.targetWidth,
            height: widget.height,
            child: Stack(
              children: [
                Positioned(
                  child: AnimatedContainer(
                    duration: widget.duration,
                    width: (widget.hovering ?? _isHovering)
                        ? widget.targetWidth
                        : widget.startWidth,
                    alignment: Alignment.centerLeft,
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: (widget.hovering ?? _isHovering)
                          ? (widget.endBorderRadius ?? widget.startBorderRadius)
                          : widget.startBorderRadius,
                    ),
                  ),
                ),
                Positioned(
                  top: widget.height / 3,
                  width: widget.targetWidth,
                  child: Center(
                    child: widget.child ??
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.title,
                              textAlign: TextAlign.center,
                              style: widget.titleStyle ?? buttonStyle,
                            ),
                            SpaceW8(),
                            Image.asset(
                              ImagePath.ARROW_RIGHT,
                              color: widget.imageColor,
                              width: 20,
                            ),
                          ],
                        ),
                  ),
                ),
              ],
            ),
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
