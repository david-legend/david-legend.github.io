import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets/content_area.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutHeader extends StatelessWidget {
  const AboutHeader({Key? key, required this.width}) : super(key: key);

  final double width;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyText1?.copyWith(
      fontSize: responsiveSize(context, 30, 46, md: 36),
      height: 1.4,
      fontWeight: FontWeight.w200,
    );
    double spacing = responsiveSize(
      context,
      width * 0.2,
      width * 0.2,
      md: width * 0.1,
    );
    double imageWidthLg = responsiveSize(
      context,
      width * 0.3,
      width * 0.3,
      md: width * 0.4,
    );
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double screenWidth = sizingInformation.screenSize.width;
      if (screenWidth <= RefinedBreakpoints().tabletSmall) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              StringConst.ABOUT_DEV_CATCH_LINE,
              style: style,
            ),
            SpaceH30(),
            Container(
              color: AppColors.black,
              child: Image.asset(
                ImagePath.DEV,
                width: widthOfScreen(context),
                height: assignHeight(context, 0.45),
              ),
            ),
          ],
        );
      } else {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContentArea(
              width: width * 0.5,
              child: SelectableText(
                StringConst.ABOUT_DEV_CATCH_LINE,
                style: style,
              ),
            ),
            SizedBox(
              width: spacing,
            ),
            Container(
              color: AppColors.black,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: imageWidthLg,
                  minWidth: imageWidthLg,
                  maxHeight: assignHeight(context, 0.55),
                ),
                child: Image.asset(ImagePath.DEV),
              ),
            ),
          ],
        );
      }
    });
  }
}
