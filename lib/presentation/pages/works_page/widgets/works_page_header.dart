import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets/animated_slide_transtion.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class WorksPageHeader extends StatefulWidget {
  const WorksPageHeader({Key? key}) : super(key: key);

  @override
  _WorksPageHeaderState createState() => _WorksPageHeaderState();
}

class _WorksPageHeaderState extends State<WorksPageHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat();
    animation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset(0, -0.5),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              ImagePath.WORKS,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              StringConst.MY_WORKS,
              style: textTheme.headline2?.copyWith(
                color: AppColors.black,
                fontSize: responsiveSize(
                  context,
                  Sizes.TEXT_SIZE_40,
                  Sizes.TEXT_SIZE_60,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: Sizes.MARGIN_40),
              child: AnimatedSlideTranstion(
                controller: controller,
                position: animation,
                child: Image.asset(
                  ImagePath.ARROW_DOWN_IOS,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
