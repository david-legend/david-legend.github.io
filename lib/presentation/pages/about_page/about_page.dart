import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/pages/about_page/widgets/about_header.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/pages/widgets/socials.dart';
import 'package:aerium/presentation/widgets/animated_underline_text.dart';
import 'package:aerium/presentation/widgets/content_area.dart';
import 'package:aerium/presentation/widgets/custom_spacer.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
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

    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyText1Style = textTheme.bodyText1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );
    TextStyle? bodyText2Style =
        textTheme.bodyText1?.copyWith(color: AppColors.grey750);
    TextStyle? titleStyle = textTheme.subtitle1?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
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
                    number: "/01 ",
                    width: contentAreaWidth,
                    section: StringConst.ABOUT_DEV_STORY.toUpperCase(),
                    title: StringConst.ABOUT_DEV_STORY_TITLE,
                    body: Column(
                      children: [
                        Text(
                          StringConst.ABOUT_DEV_STORY_CONTENT,
                          style: bodyText1Style,
                        ),
                        SpaceH30(),
                        Text(
                          StringConst.ABOUT_DEV_STORY_CONTENT,
                          style: bodyText1Style,
                        ),
                      ],
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  AboutContentBuilder(
                    number: "/02 ",
                    width: contentAreaWidth,
                    section: StringConst.ABOUT_DEV_TECHNOLOGY.toUpperCase(),
                    title: StringConst.ABOUT_DEV_TECHNOLOGY_TITLE,
                    body: Column(
                      children: [
                        SelectableText(
                          StringConst.ABOUT_DEV_TECHNOLOGY_CONTENT,
                          style: bodyText1Style,
                        ),
                        SpaceH30(),
                        SelectableText(
                          StringConst.ABOUT_DEV_TECHNOLOGY_CONTENT,
                          style: bodyText1Style,
                        ),
                      ],
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  AboutContentBuilder(
                    number: "/03 ",
                    width: contentAreaWidth,
                    section: StringConst.ABOUT_DEV_CONTACT.toUpperCase(),
                    title: StringConst.ABOUT_DEV_CONTACT_SOCIAL,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpaceH20(),
                        Row(
                          children: _buildSocials(Data.socialData2),
                        ),
                      ],
                    ),
                    footer: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpaceH40(),
                        Text(
                          StringConst.ABOUT_DEV_CONTACT_EMAIL,
                          style: titleStyle,
                        ),
                        SpaceH40(),
                        AnimatedUnderlineText(
                          text: StringConst.DEV_EMAIL,
                          onTap: () {
                            Functions.launchUrl(StringConst.EMAIL_URL);
                          },
                          textStyle: bodyText2Style,
                        ),
                      ],
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  SelectableText(
                    StringConst.FAMOUS_QUOTE,
                    textAlign: TextAlign.center,
                    style: titleStyle?.copyWith(
                        fontSize: Sizes.TEXT_SIZE_36, height: 2.0),
                  ),
                  SpaceH40(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SelectableText(
                      "— ${StringConst.FAMOUS_QUOTE_AUTHOR}",
                      style: textTheme.bodyText1?.copyWith(
                        fontSize: Sizes.TEXT_SIZE_18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey600,
                      ),
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.2),
                ],
              ),
            ),
          ),
          SimpleFooter()
        ],
      ),
    );
  }

  List<Widget> _buildSocials(List<SocialData> data) {
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
        AnimatedUnderlineText(
          text: data[index].name,
          onTap: () {
            Functions.launchUrl(data[index].url);
          },
          textStyle: style,
        ),
      );

      if (index < data.length - 1) {
        items.add(SpaceW20());
        items.add(
          Text('/', style: slashStyle),
        );
        items.add(SpaceW20());
      }
    }

    return items;
  }
}
