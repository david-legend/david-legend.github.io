import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class SocialData {
  final IconData iconData;
  final String url;
  final String name;
  final Color? color;

  SocialData({
    required this.name,
    required this.iconData,
    required this.url,
    this.color = AppColors.white,
  });
}

class Socials extends StatelessWidget {
  Socials({
    Key? key,
    required this.socialData,
    this.size = Sizes.ICON_SIZE_18,
    this.color = AppColors.white,
    this.spacing = Sizes.SIZE_40,
    this.runSpacing = Sizes.SIZE_16,
    this.isHorizontal = true,
  })  : assert(socialData.length > 0),
        super(key: key);

  final List<SocialData> socialData;
  final double size;
  final Color color;
  final double spacing;
  final double runSpacing;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isHorizontal ? Wrap(
        spacing: spacing,
        runSpacing: runSpacing,
        children: _buildSocialIcons(socialData),
      ) : Column(
        children: _buildSocialIcons(socialData),
      ),
    );
  }

  List<Widget> _buildSocialIcons(List<SocialData> socialData) {
    List<Widget> items = [];

    for (int index = 0; index < socialData.length; index++) {
      items.add(
        InkWell(
          onTap: () => Functions.launchUrl(socialData[index].url),
          child: Icon(
            socialData[index].iconData,
            color: socialData[index].color ?? color,
            size: size,
          ),
        ),
      );

      // if it is vertical, add spaces
      if(!isHorizontal) {
        items.add(SpaceH30());
      }
    }

    return items;
  }
}
