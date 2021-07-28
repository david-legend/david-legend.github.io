import 'package:flutter/material.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';

class ContactInfo extends StatelessWidget {
  ContactInfo({
    this.contactType = StringConst.EMAIL,
    this.contact = StringConst.DEV_EMAIL,
    this.contactTypeTextStyle,
    this.contactTextStyle,
    this.iconData = Icons.mail_outline,
    this.iconSize,
    this.iconColor = AppColors.black,
    this.onTap,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.iconsMainAxisAlignment = MainAxisAlignment.start,
  });

  final String contactType;
  final String contact;
  final TextStyle? contactTypeTextStyle;
  final TextStyle? contactTextStyle;
  final IconData iconData;
  final Color iconColor;
  final double? iconSize;
  final GestureTapCallback? onTap;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment iconsMainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            contactType,
            style: contactTypeTextStyle ??
                theme.textTheme.headline5!.copyWith(
                  color: AppColors.accentColor2,
                ),
          ),
          SpaceH4(),
          InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: iconsMainAxisAlignment,
              children: [
                Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                ),
                SpaceW4(),
                Text(
                  contact,
                  style: contactTextStyle ??
                      theme.textTheme.bodyText1!.copyWith(
                        fontSize: Sizes.TEXT_SIZE_18,
                        color: AppColors.black,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
