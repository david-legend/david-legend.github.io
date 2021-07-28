import 'package:flutter/material.dart';
import 'package:aerium/presentation/widgets/skill_progress_painter.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';

class SkillLevel extends StatelessWidget {
  SkillLevel({
    required this.skillLevel,
    required this.skillName,
    this.width,
    this.circleWidth = Sizes.WIDTH_60,
    this.circleHeight = Sizes.HEIGHT_60,
    this.textStyle,
    this.skillNameTextStyle,
    this.duration = const Duration(milliseconds: 500),
    this.progressColor = AppColors.primaryColor,
    this.baseColor = AppColors.cream500,
  });

  final double skillLevel;
  final String skillName;
  final double? width;
  final double circleWidth;
  final double circleHeight;
  final TextStyle? textStyle;
  final TextStyle? skillNameTextStyle;
  final Duration duration;
  final Color progressColor;
  final Color baseColor;

  @override
  Widget build(BuildContext context) {
    var actualSkillLevel = skillLevel / 10;
    ThemeData theme = Theme.of(context);
    return Container(
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: skillLevel),
            duration: duration,
            child: Container(
              width: circleWidth,
              height: circleHeight,
              child: Center(
                child: Text(
                  actualSkillLevel.toString(),
                  style: textStyle ??
                      theme.textTheme.subtitle1!.copyWith(
                        color: AppColors.accentColor2,
                      ),
                ),
              ),
            ),
            builder: (
              BuildContext context,
              double value,
              Widget? child,
            ) {
              return CustomPaint(
                foregroundPainter: SkillProgressPainter(
                  currentProgress: value,
                  circleColor: baseColor,
                  progressArcColor: progressColor,
                ),
                child: AnimatedOpacity(
                  opacity: value / 100,
                  duration: duration,
                  child: child,
                ),
              );
            },
          ),
          SpaceW8(),
          Expanded(
            child: Text(
              skillName,
              style: skillNameTextStyle ??
                  theme.textTheme.subtitle1!.copyWith(
                    color: AppColors.accentColor2,
                  ),
            ),
          ),
        ],
      ),
    );
  }

//  List<Widget> _buildSkillItem({
//    @required BuildContext context,
//    @required List<SkillData> skillData,
//  }) {
//    List<Widget> skillWidgets = [];
//    ThemeData theme = Theme.of(context);
//    for (var index = 0; index < skillData.length; index++) {
//      var actualSkillLevel = skillData[index].skillLevel / 10;
//      skillWidgets.add(
//        Row(
//          mainAxisSize: MainAxisSize.min,
//          children: [
//            TweenAnimationBuilder(
//              tween: Tween<double>(begin: 0, end: skillLevel),
//              duration: duration,
//              child: Container(
//                width: circleWidth,
//                height: circleHeight,
//                child: Center(
//                  child: Text(
//                    actualSkillLevel.toString(),
//                    style: textStyle ??
//                        theme.textTheme.subtitle1.copyWith(
//                          color: AppColors.accentColor2,
//                        ),
//                  ),
//                ),
//              ),
//              builder: (
//                BuildContext context,
//                double value,
//                Widget child,
//              ) {
//                return CustomPaint(
//                  foregroundPainter: SkillProgressPainter(
//                    currentProgress: value,
//                    circleColor: baseColor,
//                    progressArcColor: progressColor,
//                  ),
//                  child: AnimatedOpacity(
//                    opacity: value / 100,
//                    duration: duration,
//                    child: child,
//                  ),
//                );
//              },
//            ),
//            SpaceW8(),
//            Text(
//              skillData[index].skillName,
//              style: skillNameTextStyle ??
//                  theme.textTheme.subtitle1.copyWith(
//                    color: AppColors.accentColor2,
//                  ),
//            ),
//          ],
//        ),
//      );
//    }
//
//    return skillWidgets;
//  }
}
