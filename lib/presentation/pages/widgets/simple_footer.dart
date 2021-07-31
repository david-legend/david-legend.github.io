import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/widgets/socials.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SimpleFooter extends StatelessWidget {
  const SimpleFooter({
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
    return Container(
      width: width ?? widthOfScreen(context),
      height: height ?? assignHeight(context, 0.2),
      color: backgroundColor,
      child: Center(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.isMobile) {
              return Column(
                children: [
                  Spacer(flex: 2),
                  Socials(socialData: Data.socialData),
                  Spacer(flex: 2),
                  Text(
                    StringConst.COPYRIGHT,
                    style: style,
                  ),
                  Spacer(),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    StringConst.COPYRIGHT,
                    style: style,
                  ),
                  SpaceW20(),
                  Socials(socialData: Data.socialData)
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
