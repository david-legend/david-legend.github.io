import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets/custom_spacer.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

const double containerWidth = 180;

class LoadingPage extends StatefulWidget {
  static const String loadingPageRoute = StringConst.LOADING_PAGE;
  // bool loadingDone;
  final VoidCallback onLoadingDone;
  LoadingPage({
    Key? key,
    required this.onLoadingDone,
    // this.loadingDone = false,
  }) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeOutController;
  late AnimationController _containerController;
  late AnimationController _scaleOpacityController;
  late Animation<double> containerAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;
  late Animation<double> fadeAnimation;
  final Duration _scaleDuration = Duration(milliseconds: 750);
  final Duration _leftRightContainerDuration = Duration(milliseconds: 750);
  final Duration _containerDuration = Duration(milliseconds: 2000);
  bool _leftRightAnimationStarted = false;
  bool _leftRightAnimationDone = false;

  @override
  void initState() {
    super.initState();
    _scaleOpacityController = AnimationController(
      vsync: this,
      duration: _scaleDuration,
    );
    _containerController = AnimationController(
      vsync: this,
      duration: _containerDuration,
    );
    _fadeOutController = AnimationController(
      vsync: this,
      duration: _leftRightContainerDuration,
    );
    scaleAnimation = Tween<double>(begin: 0.9, end: 0.5).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.easeIn,
      ),
    );
    fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _fadeOutController,
        curve: Curves.easeIn,
      ),
    );
    containerAnimation = Tween<double>(begin: 0, end: containerWidth).animate(
      CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    _scaleOpacityController.forward();
    _scaleOpacityController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _containerController.forward();
        });
      }
    });
    _containerController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _leftRightAnimationStarted = true;
          _fadeOutController.forward();
        });
      }
    });

    _fadeOutController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _leftRightAnimationDone = true;
        });
      }
    });

    
  }

  @override
  void dispose() {
    _fadeOutController.dispose();
    _scaleOpacityController.dispose();
    _containerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double halfHeightOfScreen = screenHeight / 2;
    double widthFactorLg = 0.4;
    double widthOfLeftLine = assignWidth(context, widthFactorLg);
    double widthOfRightLine = screenWidth - (widthOfLeftLine + containerWidth);
    double leftContainerStart = (screenWidth / 2) - (containerWidth / 2);

    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle style = textTheme.headline5!.copyWith(color: AppColors.white);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AnimatedContainer(
            width: screenWidth,
            height: _leftRightAnimationDone ? 0 : halfHeightOfScreen,
            duration: _scaleDuration,
            color: AppColors.black,
            onEnd: (){
               widget.onLoadingDone();
            },
          ),
          Positioned(
            bottom: 0,
            child: AnimatedContainer(
              width: screenWidth,
              height: _leftRightAnimationDone ? 0 : halfHeightOfScreen,
              duration: _scaleDuration,
              color: AppColors.black,
            ),
          ),
          Container(
            width: widthOfScreen(context),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CustomSpacer(widthFactor: widthFactorLg),
                      FadeTransition(
                        opacity: fadeAnimation,
                        child: AnimatedBuilder(
                          animation: _scaleOpacityController,
                          child: Text(
                            'DAVID COBBINA',
                            style: style,
                          ),
                          builder: (context, child) => Transform.scale(
                            scale: 2 * scaleAnimation.value,
                            alignment: Alignment.center,
                            child: AnimatedOpacity(
                              opacity: opacityAnimation.value,
                              child: child,
                              duration: _scaleDuration,
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(widthFactor: widthFactorLg),
                    ],
                  ),
                  SpaceH20(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: widthOfLeftLine,
                        child: Stack(
                          children: [
                            Container(
                              width: widthOfLeftLine,
                              height: 1,
                              color: AppColors.white,
                            ),
                            Positioned(
                              child: AnimatedContainer(
                                width: _leftRightAnimationStarted
                                    ? 0
                                    : leftContainerStart,
                                height: 1,
                                color: AppColors.black,
                                duration: _leftRightContainerDuration,
                                // curve: Curves.ease,
                              ),
                            ),
                          ],
                        ),
                      ),
                      containerAnimationBuilder(
                        controller: _containerController,
                        animation: containerAnimation,
                      ),
                      Container(
                        width: widthOfRightLine,
                        child: Stack(
                          children: [
                            Container(
                              width: widthOfRightLine,
                              height: 1,
                              color: AppColors.white,
                            ),
                            Positioned(
                              right: 0,
                              child: AnimatedContainer(
                                width: _leftRightAnimationStarted
                                    ? 0
                                    : widthOfRightLine,
                                height: 1,
                                color: AppColors.black,
                                duration: _leftRightContainerDuration,
                                onEnd: () {
                                  // Navigator.of(context)
                                  //     .pushNamed(HomePage.homePageRoute);
                                },
                                // curve: Curves.ease,
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
          ),
        ],
      ),
    );
  }

  Widget containerAnimationBuilder({
    required Animation<double> animation,
    required AnimationController controller,
    Color color = AppColors.white,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        height: 1,
        width: animation.value,
        color: color,
      ),
    );
  }
}
