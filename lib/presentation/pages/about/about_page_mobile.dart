import 'package:flutter/material.dart';
import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/about/about_page.dart';
import 'package:aerium/presentation/widgets/app_drawer.dart';
import 'package:aerium/presentation/widgets/bottom_draggable_scrollable_sheet.dart';
import 'package:aerium/presentation/widgets/content_wrapper.dart';
import 'package:aerium/presentation/widgets/custom_app_bar.dart';
import 'package:aerium/presentation/widgets/flicker_text_animation.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';

class AboutPageMobile extends StatefulWidget {
  @override
  _AboutPageMobileState createState() => _AboutPageMobileState();
}

class _AboutPageMobileState extends State<AboutPageMobile>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late AnimationController _controller;
  late AnimationController _flickerAnimationController;
  late AnimationController _flickerAnimationController2;
  late Animation<double> opacityAnimation;
  bool _isPunchLineVisible = false;
  bool _isContentVisible = false;

  @override
  void initState() {
    _flickerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _flickerAnimationController2 = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _playFlickerAnimation();
    });
    initializeTweens();
    _flickerAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isPunchLineVisible = true;
        });
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          _playFlickerAnimation2();
        });
      }
    });

    _flickerAnimationController2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isContentVisible = true;
        });
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          _playAnimation();
        });
      }
    });

    super.initState();
  }

  initializeTweens() {
    opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeInOutCubic,
        ),
      ),
    );
  }

  Future<void> _playFlickerAnimation() async {
    try {
      await _flickerAnimationController.forward().orCancel;
      await _flickerAnimationController.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playFlickerAnimation2() async {
    try {
      await _flickerAnimationController2.forward().orCancel;
      await _flickerAnimationController2.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  void dispose() {
    _flickerAnimationController.dispose();
    _flickerAnimationController2.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: StringConst.ABOUT_ME,
          onLeadingPressed: () {
            if (_scaffoldKey.currentState!.isEndDrawerOpen) {
              _scaffoldKey.currentState!.openEndDrawer();
            } else {
              _scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: AboutPage.aboutPageRoute,
      ),
      body: Stack(
        children: [
          ContentWrapper(
            child: ListView(
              padding: EdgeInsets.only(
                top: Sizes.PADDING_24,
                left: Sizes.PADDING_24,
              ),
              children: [
                FlickerTextAnimation(
                  text: StringConst.INTRO,
                  textColor: AppColors.primaryColor,
                  fadeInColor: AppColors.primaryColor,
                  controller: _flickerAnimationController.view,
                  textStyle: theme.textTheme.bodyText1!.copyWith(
                    fontSize: Sizes.TEXT_SIZE_16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.accentColor2,
                  ),
                ),
                FlickerTextAnimation(
                  text: StringConst.DEV_NAME,
                  textColor: AppColors.primaryColor,
                  fadeInColor: AppColors.primaryColor,
                  fontSize: Sizes.TEXT_SIZE_24,
                  controller: _flickerAnimationController.view,
                ),
                _isPunchLineVisible
                    ? FlickerTextAnimation(
                        text: StringConst.PUNCH_LINE,
                        textColor: AppColors.primaryColor,
                        fadeInColor: AppColors.primaryColor,
                        controller: _flickerAnimationController2.view,
                        textStyle: theme.textTheme.subtitle1!.copyWith(
                          fontSize: Sizes.TEXT_SIZE_24,
                          color: AppColors.primaryColor,
                        ),
                      )
                    : Container(),
                SpaceH16(),
                _isContentVisible ? _fadeInContent() : Container(),
              ],
            ),
          ),
          _isContentVisible ? _fadeInImage() : Container(),
          BottomDraggableScrollableSheet(),
        ],
      ),
    );
  }

  Widget _fadeInImage() {
    return AnimatedBuilder(
      animation: _controller,
      child: Image.asset(
        ImagePath.DEV,
        height: heightOfScreen(context),
        fit: BoxFit.cover,
      ),
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          right: widthOfScreen(context) > 450
              ? -assignWidth(context: context, fraction: 0.2)
              : -assignWidth(context: context, fraction: 0.7),
          child: FadeTransition(
            opacity: opacityAnimation,
            child: child,
          ),
        );
      },
    );
  }

  Widget _fadeInContent() {
    ThemeData theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _controller,
      child: Text(
        StringConst.ABOUT_DEV_TEXT,
        style: theme.textTheme.bodyText1!.copyWith(color: AppColors.bodyText1),
      ),
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: opacityAnimation,
          child: Row(
            children: [
              Container(
                width: assignWidth(context: context, fraction: 0.4),
                child: child,
              ),
            ],
          ),
        );
      },
    );
  }
}
