import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/widgets/animated_bubble_button.dart';
import 'package:aerium/presentation/widgets/empty.dart';
import 'package:aerium/presentation/widgets/project_item.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<String> titles = [
  StringConst.PLATFORM,
  StringConst.CATEGORY,
  StringConst.AUTHOR,
  StringConst.DESIGNER,
  StringConst.TECHNOLOGY_USED,
];

class Aboutproject extends StatelessWidget {
  const Aboutproject({
    Key? key,
    required this.projectData,
    required this.width,
  }) : super(key: key);

  final ProjectItemData projectData;
  final double width;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyTextStyle = textTheme.bodyText1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );
    BorderRadiusGeometry borderRadius = BorderRadius.all(
      Radius.circular(100.0),
    );
    TextStyle? buttonStyle = textTheme.bodyText1?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_14,
        Sizes.TEXT_SIZE_16,
        sm: Sizes.TEXT_SIZE_15,
      ),
      fontWeight: FontWeight.w500,
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.ABOUT_PROJECT,
            style: textTheme.headline4?.copyWith(
              fontSize: Sizes.TEXT_SIZE_48,
            ),
          ),
          SpaceH40(),
          Text(
            projectData.portfolioDescription,
            style: bodyTextStyle,
          ),
          SpaceH40(),
          Container(
            width:
                responsiveSize(context, width, width * 0.55, md: width * 0.75),
            child: Wrap(
              spacing: responsiveSize(context, width * 0.2, 48, md: 36),
              runSpacing: responsiveSize(context, 30, 40),
              children: [
                ProjectData(
                  title: StringConst.PLATFORM,
                  subtitle: projectData.platform,
                ),
                ProjectData(
                  title: StringConst.CATEGORY,
                  subtitle: projectData.category,
                ),
                ProjectData(
                  title: StringConst.AUTHOR,
                  subtitle: StringConst.DEV_NAME,
                ),
              ],
            ),
          ),
          projectData.designer != null ? SpaceH30() : Empty(),
          projectData.designer != null
              ? ProjectData(
                  title: StringConst.DESIGNER,
                  subtitle: projectData.designer!,
                )
              : Empty(),
          projectData.technologyUsed != null ? SpaceH30() : Empty(),
          projectData.technologyUsed != null
              ? ProjectData(
                  title: StringConst.TECHNOLOGY_USED,
                  subtitle: projectData.technologyUsed!,
                )
              : Empty(),
          SpaceH30(),
          Row(
            children: [
              projectData.isLive
                  ? AnimatedBubbleButton(
                      title: StringConst.LAUNCH_APP,
                      color: AppColors.grey100,
                      imageColor: AppColors.black,
                      // targetWidth: 200,
                      startBorderRadius: borderRadius,
                      titleStyle: buttonStyle,
                      onTap: () {
                        Functions.launchUrl(projectData.webUrl);
                      },
                    )
                  : Empty(),
              projectData.isLive ? Spacer() : Empty(),
              projectData.isPublic
                  ? AnimatedBubbleButton(
                      title: StringConst.SOURCE_CODE,
                      color: AppColors.grey100,
                      imageColor: AppColors.black,
                     
                      startBorderRadius: borderRadius,
                      titleStyle: buttonStyle,
                      onTap: () {
                        Functions.launchUrl(projectData.gitHubUrl);
                      },
                    )
                  : Empty(),
              projectData.isPublic ? Spacer() : Empty(),
            ],
          ),
          projectData.isPublic || projectData.isLive ? SpaceH30() : Empty(),
          projectData.isOnPlayStore
              ? InkWell(
                  onTap: () {
                    Functions.launchUrl(projectData.playStoreUrl);
                  },
                  child: Image.asset(
                    ImagePath.GOOGLE_PLAY,
                    width: responsiveSize(context, width * 0.70, width * 0.30),
                    fit: BoxFit.fitHeight,
                  ),
                )
              : Empty(),
        ],
      ),
    );
  }
}

class ProjectData extends StatelessWidget {
  const ProjectData({
    Key? key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? defaultTitleStyle = textTheme.subtitle1?.copyWith(
      color: AppColors.black,
      fontSize: 17,
    );
    TextStyle? defaultSubtitleStyle = textTheme.bodyText1?.copyWith(
      fontSize: 15,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: titleStyle ?? defaultTitleStyle,
        ),
        SpaceH12(),
        Text(
          subtitle,
          style: subtitleStyle ?? defaultSubtitleStyle,
        ),
      ],
    );
  }
}
