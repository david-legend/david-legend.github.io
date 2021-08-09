import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/widgets/animated_line_through_text.dart';
import 'package:aerium/presentation/widgets/project_item.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class NoteWorthyProjects extends StatelessWidget {
  const NoteWorthyProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? titleStyle = textTheme.subtitle1?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_20,
        Sizes.TEXT_SIZE_30,
      ),
    );

    TextStyle? bodyText1Style = textTheme.bodyText1?.copyWith(
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_18,
      ),
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.NOTE_WORTHY_PROJECTS,
            style: titleStyle,
          ),
          SpaceH16(),
          Text(
            StringConst.NOTE_WORTHY_PROJECTS_DESC,
            style: bodyText1Style,
          ),
          SpaceH40(),
          ..._buildNoteworthyProjects(Data.projectItemData),
        ],
      ),
    );
  }

  List<Widget> _buildNoteworthyProjects(List<ProjectItemData> data) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        NoteWorthyProjectItem(
          number: index + 1 > 9 ? "/${index + 1}" : "/0${index + 1}",
          projectName: data[index].title,
          onSourceTap: () {
            Functions.launchUrl(data[index].gitHubUrl);
          },
          onProjectNameTap: () {
            // Functions.launchUrl(data[index].gitHubUrl);
          },
        ),
      );
      items.add(SpaceH40());
    }

    return items;
  }
}

class NoteWorthyProjectItem extends StatelessWidget {
  const NoteWorthyProjectItem({
    Key? key,
    required this.number,
    required this.projectName,
    this.source = "<src/>",
    this.numberStyle,
    this.projectNameStyle,
    this.sourceStyle,
    this.onSourceTap,
    this.onProjectNameTap,
  }) : super(key: key);

  final String number;
  final String source;
  final String projectName;
  final TextStyle? numberStyle;
  final TextStyle? sourceStyle;
  final TextStyle? projectNameStyle;
  final GestureTapCallback? onSourceTap;
  final GestureTapCallback? onProjectNameTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultNumberStyle = textTheme.subtitle1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.grey550,
      fontWeight: FontWeight.w400,
    );
    TextStyle? defaultSourceStyle = textTheme.subtitle1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.grey700,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    );
    TextStyle? defaultProjectNameStyle = textTheme.subtitle1?.copyWith(
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
        sm: Sizes.TEXT_SIZE_18,
      ),
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    );
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            number,
            style: numberStyle ?? defaultNumberStyle,
          ),
          SpaceW20(),
          InkWell(
            onTap: onSourceTap,
            hoverColor: Colors.transparent,
            child: Text(
              source,
              style: sourceStyle ?? defaultSourceStyle,
            ),
          ),
          SpaceW20(),
          Expanded(
            child: AnimatedLineThroughText(
              text: projectName,
              onTap: onProjectNameTap,
              textStyle: projectNameStyle ?? defaultProjectNameStyle,
              isUnderlinedOnHover: false,
              isUnderlinedByDefault: true,
            ),
          ),
        ],
      ),
    );
  }
}
