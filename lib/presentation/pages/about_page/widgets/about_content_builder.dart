import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets/empty.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AboutContentBuilder extends StatelessWidget {
  const AboutContentBuilder({
    Key? key,
    required this.width,
    required this.number,
    required this.section,
    required this.title,
    required this.body,
    this.numberStyle,
    this.sectionStyle,
    this.titleStyle,
    this.footer,
  }) : super(key: key);

  final double width;
  final String number;
  final String section;
  final String title;
  final TextStyle? numberStyle;
  final TextStyle? sectionStyle;
  final TextStyle? titleStyle;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultNumberStyle = textTheme.bodyText1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_10,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      letterSpacing: 2,
    );
    TextStyle? defaultSectionStyle = defaultNumberStyle?.copyWith(
      color: AppColors.grey600,
    );
    TextStyle? defaultTitleStyle = textTheme.subtitle1?.copyWith(
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
      ),
    );
    return Container(
        width: width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  number,
                  style: numberStyle ?? defaultNumberStyle,
                ),
                SpaceW16(),
                Text(
                  section,
                  style: sectionStyle ?? defaultSectionStyle,
                ),
              ],
            ),
            Spacer(),
            Container(
              width: width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleStyle ?? defaultTitleStyle,
                  ),
                  SpaceH20(),
                  body,
                  footer ?? Empty(),
                ],
              ),
            )
          ],
        ));
  }
}
