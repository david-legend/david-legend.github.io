import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

import 'aerium_button.dart';

class CertificationCard extends StatefulWidget {
  CertificationCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.actionTitle,
    this.width = 500,
    this.height = 400,
    this.elevation,
    this.shadow,
    this.hoverColor = AppColors.accentColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.actionTitleTextStyle,
    this.duration = 1000,
    this.onTap,
  });

  final double width;
  final double height;
  final String imageUrl;
  final double? elevation;
  final Shadow? shadow;
  final String title;
  final String subtitle;
  final String actionTitle;
  final Color hoverColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? actionTitleTextStyle;
  final int duration;
  final GestureTapCallback? onTap;

  @override
  _CertificationCardState createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard>
    with TickerProviderStateMixin {
  late AnimationController _portfolioCoverController;
  late Animation<double> _opacityAnimation;
  final int duration = 400;
  bool _hovering = false;

  @override
  void initState() {
    _portfolioCoverController = AnimationController(
      duration: Duration(milliseconds: duration),
      vsync: this,
    );
    initTweens();

    super.initState();
  }

  @override
  void dispose() {
    _portfolioCoverController.dispose();
    super.dispose();
  }

  void initTweens() {
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 0.8,
    ).animate(
      CurvedAnimation(
        parent: _portfolioCoverController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Future<void> _playPortfolioCoverAnimation() async {
    try {
      await _portfolioCoverController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        child: MouseRegion(
          onEnter: (e) => _mouseEnter(true),
          onExit: (e) => _mouseEnter(false),
          child: Stack(
            children: [
              Image.asset(
                widget.imageUrl,
                width: widget.width,
                height: widget.height,
                fit: BoxFit.cover,
              ),
              _hovering
                  ? FadeTransition(
                      opacity: _opacityAnimation,
                      child: Container(
                        width: widget.width,
                        height: widget.height,
                        color: widget.hoverColor,
                        child: Column(
                          children: [
                            Spacer(flex: 1),
                            Text(
                              widget.title,
                              textAlign: TextAlign.center,
                              style: widget.titleTextStyle ??
                                  theme.textTheme.headline4?.copyWith(
                                    color: AppColors.black,
                                  ),
                            ),
                            SpaceH4(),
                            Text(
                              widget.subtitle,
                              textAlign: TextAlign.center,
                              style: widget.subtitleTextStyle ??
                                  theme.textTheme.bodyText1?.copyWith(
                                    color: AppColors.black,
                                    fontSize: Sizes.TEXT_SIZE_16,
                                  ),
                            ),
                            SpaceH16(),
                            AeriumButton(
                              height: Sizes.HEIGHT_36,
                              hasIcon: false,
                              width: 80,
                              buttonColor: AppColors.white,
                              borderColor: AppColors.black,
                              onHoverColor: AppColors.black,
                              title: widget.actionTitle.toUpperCase(),
                              onPressed: widget.onTap,
                            ),
                            // Text(
                            //   widget.actionTitle,
                            //   textAlign: TextAlign.center,
                            //   style: widget.actionTitleTextStyle ??
                            //       theme.textTheme.subtitle1?.copyWith(
                            //         color: AppColors.grey800,
                            //       ),
                            // ),
                            SpaceH4(),
                            // HorizontalBar(color: AppColors.secondaryColor),
                            Spacer(flex: 1),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });

    if (_hovering == true) {
      _playPortfolioCoverAnimation();
    } else if (_hovering == false) {
      _portfolioCoverController.reverse().orCancel;
    }
  }
}
