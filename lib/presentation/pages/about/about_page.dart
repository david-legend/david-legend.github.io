import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/pages/about/widgets/about_header.dart';
import 'package:aerium/presentation/pages/about/widgets/technology_section.dart';
import 'package:aerium/presentation/pages/widgets/animated_footer.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/pages/widgets/sliding_banner.dart';
import 'package:aerium/presentation/pages/widgets/socials.dart';
import 'package:aerium/presentation/widgets/animated_line_through_text.dart';
import 'package:aerium/presentation/widgets/animated_positioned_text.dart';
import 'package:aerium/presentation/widgets/animated_positioned_widget.dart';
import 'package:aerium/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:aerium/presentation/widgets/content_area.dart';
import 'package:aerium/presentation/widgets/custom_spacer.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../widgets/content_builder.dart';

class AboutPage extends StatefulWidget {
  static const String aboutPageRoute = StringConst.ABOUT_PAGE;
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _storyController;
  late AnimationController _technologyController;
  late AnimationController _contactController;
  late AnimationController _quoteController;
  late Animation<AlignmentGeometry> align;
  GlobalKey storySectionKey = GlobalKey();
  GlobalKey technologySectionKey = GlobalKey();
  GlobalKey contactSectionKey = GlobalKey();
  late double storySectionHeight = 50;
  late double technologySectionHeight = 50;
  late double contactSectionHeight = 50;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getHeightOfRoleLeaf();
    });
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _storyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _contactController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _quoteController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    align = Tween<AlignmentGeometry>(
            begin: Alignment(-1, 1), end: Alignment(1,-1))
        .animate(_storyController);
    super.initState();
  }

  _getHeightOfRoleLeaf() {
    final RenderBox storyRenderBox =
        storySectionKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox technologyRenderBox =
        technologySectionKey.currentContext!.findRenderObject() as RenderBox;
    final RenderBox contactRenderBox =
        contactSectionKey.currentContext!.findRenderObject() as RenderBox;

    setState(() {
      storySectionHeight = storyRenderBox.size.height;
      technologySectionHeight = technologyRenderBox.size.height;
      contactSectionHeight = contactRenderBox.size.height;
      // print(
      //     "$storySectionHeight $technologySectionHeight $contactSectionHeight");
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _storyController.dispose();
    _technologyController.dispose();
    _contactController.dispose();
    _quoteController.dispose();
    super.dispose();
  }

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
      navBarAnimationController: _controller,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                children: [
                  AboutHeader(
                    width: contentAreaWidth,
                    controller: _controller,
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('story-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 50) {
                        _storyController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _storyController,
                      number: "/01 ",
                      width: contentAreaWidth,
                      section: StringConst.ABOUT_DEV_STORY.toUpperCase(),
                      title: StringConst.ABOUT_DEV_STORY_TITLE,
                      body: Column(
                        key: storySectionKey,
                        children: [
                          SelectableText(
                            StringConst.ABOUT_DEV_STORY_CONTENT,
                            style: bodyText1Style,
                          ),
                          SpaceH30(),
                          SelectableText(
                            StringConst.ABOUT_DEV_STORY_CONTENT,
                            style: bodyText1Style,
                          ),
                          AlignTransition(
                              alignment: align,
                              child: SelectableText(
                                StringConst.ABOUT_DEV_STORY_CONTENT,
                                style: bodyText1Style,
                              )),
                          // AnimatedPositionedWidget(
                          //   height: storySectionHeight,
                          //   width: contentAreaWidth,
                          //   child: SelectableText(
                          //     StringConst.ABOUT_DEV_STORY_CONTENT,
                          //     style: bodyText1Style,
                          //   ),
                          //   controller: CurvedAnimation(
                          //     parent: _storyController,
                          //     curve: Curves.fastOutSlowIn,
                          //   ),
                          // ),
                          // SpaceH30(),
                          // AnimatedPositionedText(
                          //   text: StringConst.ABOUT_DEV_STORY_CONTENT,
                          //   textStyle: bodyText1Style,
                          //   controller: CurvedAnimation(
                          //     parent: _storyController,
                          //     curve: Curves.fastOutSlowIn,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('technology-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 50) {
                        _technologyController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _technologyController,
                      number: "/02 ",
                      width: contentAreaWidth,
                      section: StringConst.ABOUT_DEV_TECHNOLOGY.toUpperCase(),
                      title: StringConst.ABOUT_DEV_TECHNOLOGY_TITLE,
                      body: Column(
                        key: technologySectionKey,
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
                      footer: Column(
                        children: [
                          SpaceH40(),
                          TechnologySection(width: contentAreaWidth),
                        ],
                      ),
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('contact-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 50) {
                        _contactController.forward();
                      }
                    },
                    child: ContentBuilder(
                      controller: _contactController,
                      number: "/03 ",
                      width: contentAreaWidth,
                      section: StringConst.ABOUT_DEV_CONTACT.toUpperCase(),
                      title: StringConst.ABOUT_DEV_CONTACT_SOCIAL,
                      body: Column(
                        key: contactSectionKey,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpaceH20(),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
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
                          AnimatedLineThroughText(
                            text: StringConst.DEV_EMAIL,
                            onTap: () {
                              Functions.launchUrl(StringConst.EMAIL_URL);
                            },
                            textStyle: bodyText2Style,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.1),
                  VisibilityDetector(
                    key: Key('quote-section'),
                    onVisibilityChanged: (visibilityInfo) {
                      double visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage > 50) {
                        _quoteController.forward();
                      }
                    },
                    child: Column(
                      children: [
                        AnimatedTextSlideBoxTransition(
                          controller: _quoteController,
                          text: StringConst.FAMOUS_QUOTE,
                          textAlign: TextAlign.center,
                          textStyle: titleStyle?.copyWith(
                            fontSize: responsiveSize(
                              context,
                              Sizes.TEXT_SIZE_24,
                              Sizes.TEXT_SIZE_36,
                              md: Sizes.TEXT_SIZE_28,
                            ),
                            height: 2.0,
                          ),
                        ),
                        SpaceH40(),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AnimatedTextSlideBoxTransition(
                            controller: _quoteController,
                            text: "— ${StringConst.FAMOUS_QUOTE_AUTHOR}",
                            textStyle: textTheme.bodyText1?.copyWith(
                              fontSize: responsiveSize(
                                context,
                                Sizes.TEXT_SIZE_16,
                                Sizes.TEXT_SIZE_18,
                                md: Sizes.TEXT_SIZE_16,
                              ),
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.2),
                ],
              ),
            ),
          ),
          // SlidingBanner(),
          AnimatedFooter()
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
