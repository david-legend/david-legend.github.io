import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/about_page/widgets/about_header.dart';
import 'package:aerium/presentation/widgets/content_area.dart';
import 'package:aerium/presentation/widgets/custom_spacer.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

import 'widgets/about_content_builder.dart';

class AboutPage extends StatefulWidget {
  static const String aboutPageRoute = StringConst.ABOUT_PAGE;
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.75),
      sm: assignWidth(context, 0.8),
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.10),
        // sm: assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
        // sm: assignWidth(context, 0.10),
      ),
    );
    return PageWrapper(
      selectedRoute: AboutPage.aboutPageRoute,
      selectedPageName: StringConst.ABOUT,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                children: [
                  AboutHeader(
                    width: contentAreaWidth,
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  AboutContentBuilder(
                    number: "01",
                    tag: StringConst.ABOUT_DEV_STORY,
                    title: StringConst.ABOUT_DEV_STORY_TITLE,
                    body: Text(StringConst.ABOUT_DEV_STORY_CONTENT),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
