import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets/aerium_text_form_field.dart';
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
              ],
            ),
          ),
          CustomSpacer(heightFactor: 0.1),
          SimpleFooter(),
        ],
      ),
    );
  }
}
