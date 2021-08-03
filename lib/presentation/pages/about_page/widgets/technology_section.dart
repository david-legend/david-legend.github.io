import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

const double spacing = 20;

class TechnologySection extends StatelessWidget {
  const TechnologySection({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? titleStyle = textTheme.subtitle1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.black,
    );
    return Container(
      width: width,
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;

          if (screenWidth < RefinedBreakpoints().tabletNormal) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConst.MOBILE_TECH,
                  style: titleStyle,
                ),
                SpaceH20(),
                Wrap(
                  direction: Axis.vertical,
                  spacing: 20,
                  children: _buildTechnologies(
                    context,
                    data: Data.mobileTechnologies,
                    // width: width * 0.1,
                  ),
                ),
                SpaceH40(),
                Text(
                  StringConst.OTHER_TECH,
                  style: titleStyle,
                ),
                SpaceH20(),
                Wrap(
                  spacing: (width * 0.1) / 3,
                  runSpacing: 20,
                  children: _buildTechnologies(
                    context,
                    data: Data.otherTechnologies,
                    width: width * 0.3,
                  ),
                ),
              ],
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: width * 0.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConst.MOBILE_TECH,
                        style: titleStyle,
                      ),
                      SpaceH20(),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: spacing,
                        children: _buildTechnologies(
                          context,
                          data: Data.mobileTechnologies,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: width * 0.1),
                Expanded(
                  child: Container(
                    width: (width * 0.75),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConst.OTHER_TECH,
                          style: titleStyle,
                        ),
                        SpaceH20(),
                        Wrap(
                          spacing: spacing,
                          runSpacing: spacing,
                          children: _buildTechnologies(
                            context,
                            data: Data.otherTechnologies,
                            width: ((width * 0.75) - (spacing * 3)) / 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  List<Widget> _buildTechnologies(BuildContext context,
      {required List<String> data, double? width}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyText1Style = textTheme.bodyText1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_15,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
    );
    List<Widget> items = [];
    for (var item in data) {
      items.add(
        SizedBox(
          width: width,
          child: Text(
            item,
            style: bodyText1Style,
          ),
        ),
      );
    }

    return items;
  }
}
