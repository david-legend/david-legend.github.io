import 'package:flutter/material.dart';
import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets/skill_level.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';

import 'horizontal_bar.dart';

class BottomDraggableScrollableSheet extends StatefulWidget {
  BottomDraggableScrollableSheet({
    this.initialChildSize = 0.08,
    this.maxChildSize = 0.6,
    this.minChildSize = 0.08,
    this.backgroundColor = AppColors.primaryColor,
  });

  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final Color backgroundColor;

  @override
  _BottomDraggableScrollableSheetState createState() =>
      _BottomDraggableScrollableSheetState();
}

class _BottomDraggableScrollableSheetState
    extends State<BottomDraggableScrollableSheet> {
  bool isEducationSelected = false;

  bool isKeySkillsSelected = true;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle selectedItem = theme.textTheme.bodyText1!.copyWith(
      color: AppColors.secondaryColor,
    );
    TextStyle unselectedItem = theme.textTheme.bodyText1!.copyWith(
      color: AppColors.deepBlue200,
    );
    return DraggableScrollableSheet(
      initialChildSize: widget.initialChildSize,
      minChildSize: widget.minChildSize,
      maxChildSize: widget.maxChildSize,
      builder: (
        BuildContext context,
        ScrollController scrollController,
      ) {
        return Container(
          color: widget.backgroundColor,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SpaceH8(),
                HorizontalBar(
                  color: AppColors.secondaryColor,
                  margin: EdgeInsets.only(right: 8),
                  width: 40,
                  height: 2,
                ),
                SpaceH8(),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: _switchTabs,
                        child: Text(
                          StringConst.KEY_SKILLS,
                          style: isKeySkillsSelected
                              ? selectedItem
                              : unselectedItem,
                        ),
                      ),
                      VerticalDivider(
                        thickness: 1,
                        width: 24,
                        color: AppColors.secondaryColor,
                      ),
                      InkWell(
                        onTap: _switchTabs,
                        child: Text(
                          StringConst.EDUCATION,
                          style: isEducationSelected
                              ? selectedItem
                              : unselectedItem,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.PADDING_16,
                    vertical: Sizes.PADDING_16,
                  ),
                  child: Column(
                    children: [
                      isKeySkillsSelected
                          ? _buildSkillsSection(skills: Data.skillData)
                          : Container(),
                      isEducationSelected
                          ? Text(
                              StringConst.ABOUT_DEV_TEXT,
                              style: theme.textTheme.bodyText2!.copyWith(
                                color: AppColors.secondaryColor,
                                fontSize: Sizes.TEXT_SIZE_16,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _switchTabs() {
    setState(() {
      isKeySkillsSelected = !isKeySkillsSelected;
      isEducationSelected = !isEducationSelected;
    });
  }

  Widget _buildSkillsSection({required List<SkillData> skills}) {
    List<Widget> skillWidgets = [];
    ThemeData theme = Theme.of(context);
    for (var index = 0; index < skills.length; index++) {
      skillWidgets.add(
        SkillLevel(
          width: assignWidth(context: context, fraction: 0.4),
          skillLevel: skills[index].skillLevel,
          skillName: skills[index].skillName,
          progressColor: AppColors.secondaryColor,
          baseColor: AppColors.deepBlue200,
          textStyle: theme.textTheme.bodyText1!
              .copyWith(color: AppColors.secondaryColor),
          skillNameTextStyle: theme.textTheme.bodyText1!
              .copyWith(color: AppColors.secondaryColor),
        ),
      );
    }
    return Wrap(
//      spacing: 8,
      runSpacing: 8,
      children: [
        ...skillWidgets,
      ],
    );
  }
}
