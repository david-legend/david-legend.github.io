import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/pages/widgets/socials.dart';
import 'package:aerium/presentation/widgets/animated_bubble_button.dart';
import 'package:aerium/presentation/widgets/animated_line_through_text.dart';
import 'package:aerium/presentation/widgets/animated_slide_transtion.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({Key? key}) : super(key: key);

  @override
  _HomePageHeaderState createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader>
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
      begin: Offset(0, 0.05),
      end: Offset(0, -0.05),
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
    final double screenWidth = widthOfScreen(context);
    final double screenHeight = heightOfScreen(context);
    final EdgeInsets textMargin = EdgeInsets.only(
      left: responsiveSize(context, 20, screenWidth * 0.15),
      top: responsiveSize(context, 60, screenHeight * 0.35),
      bottom: responsiveSize(context, 20, 40),
    );
    final EdgeInsets imageMargin = EdgeInsets.only(
      right: responsiveSize(context, 20, screenWidth * 0.10),
      top: responsiveSize(context, 30, screenHeight * 0.25),
      bottom: responsiveSize(context, 20, 40),
    );
    return Container(
      width: screenWidth,
      height: screenHeight,
      color: AppColors.accentColor2.withOpacity(0.35),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: assignHeight(context, 0.1),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: WhiteCircle(),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: textMargin,
                child: Container(
                  width: screenWidth * 0.35,
                  child: AboutDev(),
                ),
              ),
              SizedBox(width: screenWidth * 0.05),
              Container(
                margin: imageMargin,
                child: AnimatedSlideTranstion(
                  controller: controller,
                  position: animation,
                  child: Image.asset(
                    ImagePath.CAESAR,
                    width: screenWidth * 0.35,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WhiteCircle extends StatelessWidget {
  const WhiteCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthOfCircle = widthOfScreen(context) / 3.5;
    return Container(
      width: widthOfCircle,
      height: widthOfCircle,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(widthOfCircle / 2),
        ),
      ),
    );
  }
}

class AboutDev extends StatelessWidget {
  const AboutDev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConst.DEV_TITLE,
          style: textTheme.headline2?.copyWith(
            color: AppColors.black,
            fontSize: 48,
          ),
        ),
        SpaceH30(),
        Text(
          StringConst.DEV_DESC,
          style: textTheme.bodyText1?.copyWith(
            fontSize: responsiveSize(
              context,
              Sizes.TEXT_SIZE_16,
              Sizes.TEXT_SIZE_18,
            ),
            height: 2,
            fontWeight: FontWeight.w400,
          ),
        ),
        SpaceH40(),
        AnimatedBubbleButton(
          color: AppColors.grey100,
          imageColor: AppColors.black,
          startOffset: Offset(-0.1, 0),
          targetOffset: Offset(0, 0),
          targetWidth: 200,
          startBorderRadius: const BorderRadius.all(
            Radius.circular(100.0),
          ),
          title: StringConst.SEE_MY_WORKS.toUpperCase(),
          titleStyle: textTheme.bodyText1?.copyWith(
            color: AppColors.black,
            fontSize: Sizes.TEXT_SIZE_16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SpaceH40(),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: _buildSocials(
            context: context,
            data: Data.socialData1,
          ),
        )
      ],
    );
  }

  List<Widget> _buildSocials({
    required BuildContext context,
    required List<SocialData> data,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyText1?.copyWith(color: AppColors.grey750);
    TextStyle? slashStyle = textTheme.bodyText1?.copyWith(
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        AnimatedLineThroughText(
          text: data[index].name,
          isUnderlinedByDefault: true,
          isUnderlinedOnHover: false,
          onTap: () {
            Functions.launchUrl(data[index].url);
          },
          textStyle: style,
        ),
      );

      if (index < data.length - 1) {
        items.add(
          Text('/', style: slashStyle),
        );
      }
    }

    return items;
  }
}
