import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/widgets/socials.dart';
import 'package:aerium/presentation/widgets/animated_bubble_button.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../contact_page.dart';

class AnimatedFooter extends StatelessWidget {
  const AnimatedFooter({
    Key? key,
    this.height,
    this.width,
    this.backgroundColor = AppColors.black,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyText1?.copyWith(
      color: AppColors.accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    TextStyle? titleStyle = textTheme.headline4?.copyWith(
      color: AppColors.accentColor,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_30,
        Sizes.TEXT_SIZE_60,
        md: Sizes.TEXT_SIZE_50,
      ),
    );
    TextStyle? subtitleStyle = style?.copyWith(
      color: AppColors.grey550,
      fontSize: Sizes.TEXT_SIZE_18,
      fontWeight: FontWeight.w400,
    );
    TextStyle? buttonStyle = subtitleStyle?.copyWith(
      color: AppColors.accentColor,
      fontSize: Sizes.TEXT_SIZE_16,
      fontWeight: FontWeight.w500,
    );

    return Container(
      width: width ?? widthOfScreen(context),
      height: height ?? assignHeight(context, 0.8),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(flex: 2),
          Text(StringConst.WORK_TOGETHER,
              textAlign: TextAlign.center, style: titleStyle),
          Spacer(),
          Text(
            StringConst.AVAILABLE_FOR_FREELANCE,
            textAlign: TextAlign.center,
            style: subtitleStyle,
          ),
          SpaceH40(),
          AnimatedBubbleButton(
            title: StringConst.SAY_HELLO.toUpperCase(),
            onTap: (){
              Navigator.pushNamed(context, ContactPage.contactPageRoute);
            },
          ),
          Spacer(flex: 3),
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;
              if (screenWidth <= RefinedBreakpoints().tabletNormal) {
                return Column(
                  children: [
                    Socials(socialData: Data.socialData),
                    SpaceH40(),
                    Text(
                      StringConst.COPYRIGHT,
                      style: style,
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringConst.COPYRIGHT,
                      style: style,
                    ),
                    SpaceW20(),
                    Socials(socialData: Data.socialData),
                  ],
                );
              }
            },
          ),
          Spacer(),
        ],
      ),
    );
  }
}
