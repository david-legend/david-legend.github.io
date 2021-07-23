import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/pages/portfolio/portfolio_page.dart';
import 'package:aerium/presentation/widgets/content_wrapper.dart';
import 'package:aerium/presentation/widgets/flicker_text_animation.dart';
import 'package:aerium/presentation/widgets/menu_list.dart';
import 'package:aerium/presentation/widgets/project_cover_2.dart';
import 'package:aerium/presentation/widgets/socials.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/presentation/widgets/trailing_info.dart';
import 'package:aerium/presentation/widgets/void.dart';
import 'package:aerium/values/values.dart';

class ProjectDetailDesktop extends StatefulWidget {
  ProjectDetailDesktop({
    @required this.projectDetails,
  });

  final ProjectDetails projectDetails;

  @override
  _ProjectDetailDesktopState createState() => _ProjectDetailDesktopState();
}

class _ProjectDetailDesktopState extends State<ProjectDetailDesktop>
    with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _flickerAnimationController;
  AnimationController _contentAnimationController;
  Animation<double> _projectCoverScaleAnimation;
  Animation<double> _projectBackgroundScaleAnimation;
  Animation<double> _projectContentAnimation;
  bool _isHeadingVisible = false;
  bool _isContentVisible = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _flickerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _contentAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    initTweens();
    _playAnimation();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isHeadingVisible = true;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _playFlickerAnimation();
        });
      }
    });
    _flickerAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isContentVisible = true;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _playProjectContentAnimation();
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _flickerAnimationController.dispose();
    _contentAnimationController.dispose();
  }

  initTweens() {
    _projectCoverScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );
    _projectBackgroundScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
    _projectContentAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _contentAnimationController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.easeIn,
        ),
      ),
    );
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playFlickerAnimation() async {
    try {
      await _flickerAnimationController.forward().orCancel;
      await _flickerAnimationController.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Future<void> _playProjectContentAnimation() async {
    try {
      await _contentAnimationController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Stack(
      children: [
        Container(
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  ContentWrapper(
                    width: assignWidth(
                      context: context,
                      fraction: 0.2,
                    ),
                    color: AppColors.primaryColor,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: Sizes.MARGIN_20,
                        top: Sizes.MARGIN_20,
                        bottom: Sizes.MARGIN_20,
                      ),
                      child: MenuList(
                        menuList: Data.menuList,
                        selectedItemRouteName: PortfolioPage.portfolioPageRoute,
                      ),
                    ),
                  ),
                  ContentWrapper(
                    width: assignWidth(
                      context: context,
                      fraction: 0.8,
                    ),
                    color: AppColors.grey100,
                    child: Row(
                      children: [
                        Container(
                          width: assignWidth(
                            context: context,
                            fraction: 0.7,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                assignWidth(context: context, fraction: 0.04),
                            vertical:
                                assignHeight(context: context, fraction: 0.04),
                          ),
                          child: _buildProjectDetailContent(),
                        ),
                        SizedBox(
                          width: assignWidth(
                            context: context,
                            fraction: 0.025,
                          ),
                        ),
                        TrailingInfo(
                          width: assignWidth(
                            context: context,
                            fraction: 0.075,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: _buildAnimation,
    );
  }

  Widget _buildProjectDetailContent() {
    double offset = 40.0;
    ThemeData theme = Theme.of(context);

    return Row(
      children: [
        ProjectCover2(
          width: assignWidth(context: context, fraction: 0.30),
          height: heightOfScreen(context),
          offset: offset,
          projectCoverScale: _projectCoverScaleAnimation.value,
          backgroundScale: _projectBackgroundScaleAnimation.value,
          projectCoverBackgroundColor: AppColors.primaryColor,
          projectCoverUrl: widget.projectDetails.projectImage,
        ),
        SizedBox(
          width: assignWidth(context: context, fraction: 0.03),
        ),
        Container(
          width: assignWidth(context: context, fraction: 0.29),
          padding: EdgeInsets.only(top: offset),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _isHeadingVisible
                  ? FlickerTextAnimation(
                      text: widget.projectDetails.projectName,
                      textColor: AppColors.primaryColor,
                      fadeInColor: AppColors.primaryColor,
                      fontSize: Sizes.TEXT_SIZE_34,
                      controller: _flickerAnimationController.view,
                    )
                  : Container(),
              SpaceH16(),
              _isContentVisible
                  ? FadeTransition(
                      opacity: _projectContentAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.projectDetails.projectDescription,
                            style: theme.textTheme.bodyText1.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: Sizes.TEXT_SIZE_16,
                            ),
                          ),
                          SpaceH8(),
                          Text(
                            StringConst.BUILT_WITH +
                                widget.projectDetails.technologyUsed,
                            style: theme.textTheme.headline6.copyWith(
                              color: AppColors.primaryColor,
                              fontSize: Sizes.TEXT_SIZE_14,
                            ),
                          ),
                          SpaceH8(),
                          !widget.projectDetails.hasBeenReleased
                              ? Text(
                                  StringConst.COMING_SOON,
                                  style: theme.textTheme.headline6.copyWith(
                                    color: AppColors.primaryColor,
                                    fontSize: Sizes.TEXT_SIZE_16,
                                  ),
                                )
                              : Container(),
                          !widget.projectDetails.hasBeenReleased
                              ? SpaceH8()
                              : Container(),
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              widget.projectDetails.isPublic
                                  ? SocialButton(
                                      icon: FontAwesomeIcons.github,
                                      onPressed: () {
                                        Functions.launchUrl(
                                          widget.projectDetails.gitHubUrl,
                                        );
                                      },
                                    )
                                  : Emptiness(),
                              widget.projectDetails.isOnPlayStore
                                  ? InkWell(
                                      onTap: () {
                                        Functions.launchUrl(
                                          widget.projectDetails.playStoreUrl,
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                          Sizes.PADDING_8,
                                        ),
                                        child: Image.asset(
                                          ImagePath.PLAYSTORE,
                                          width: 24,
                                          height: 24,
                                        ),
                                      ),
                                    )
                                  : Emptiness(),
                              widget.projectDetails.isLive
                                  ? SocialButton(
                                      icon: FeatherIcons.globe,
                                      onPressed: () {
                                        Functions.launchUrl(
                                            widget.projectDetails.webUrl);
                                      },
                                    )
                                  : Emptiness(),
                            ],
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
