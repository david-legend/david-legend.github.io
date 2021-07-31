import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets/aerium_button.dart';
import 'package:aerium/presentation/widgets/aerium_text_form_field.dart';
import 'package:aerium/presentation/widgets/content_area.dart';
import 'package:aerium/presentation/widgets/custom_spacer.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  static const String contactPageRoute = StringConst.CONTACT_PAGE;
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = assignWidth(context, 0.6); //takes 60% of screen
    EdgeInsetsGeometry paddingLg = EdgeInsets.only(
      left: assignWidth(context, 0.15),
      right: assignWidth(context, 0.25),
      top: assignHeight(context, 0.3),
    );
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: paddingLg,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConst.GET_IN_TOUCH,
                    style: textTheme.headline2?.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.05),
                  Text(
                    StringConst.CONTACT_MSG,
                    style: textTheme.bodyText1?.copyWith(
                      color: AppColors.grey700,
                      fontSize: 18,
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.05),
                  AeriumTextFormField(
                    hintText: StringConst.YOUR_NAME,
                    // filled: true,
                  ),
                  SpaceH20(),
                  AeriumTextFormField(
                    hintText: StringConst.EMAIL,
                  ),
                  SpaceH20(),
                  AeriumTextFormField(
                    hintText: StringConst.SUBJECT,
                  ),
                  SpaceH20(),
                  AeriumTextFormField(
                    hintText: StringConst.MESSAGE,
                  ),
                  SpaceH20(),
                  Align(
                    alignment: Alignment.topRight,
                    child: AeriumButton(
                      height: Sizes.HEIGHT_50,
                      width: contentAreaWidth * 0.25,
                      title: StringConst.SEND_MESSAGE.toUpperCase(),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          SimpleFooter(),
        ],
      ),
    );
  }
}
