import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AeriumButton extends StatelessWidget {
  AeriumButton({
    Key? key,
    required this.title,
    this.titleStyle,
    this.width = Sizes.WIDTH_120,
    this.height = Sizes.HEIGHT_44,
    this.onPressed,
    this.hasIcon = true,
    this.iconColor = AppColors.white,
    this.buttonColor = AppColors.black,
    this.iconData = FontAwesomeIcons.telegramPlane,
    this.iconSize = Sizes.ICON_SIZE_14,
    this.buttonStyle,
  }) : super(key: key);

  final String title;
  final TextStyle? titleStyle;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final Color buttonColor;
  final double width;
  final double height;
  final ButtonStyle? buttonStyle;
  final VoidCallback? onPressed;
  final bool hasIcon;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyText1?.copyWith(
      // fontFamily: StringConst.VISUELT_PRO,
      color: AppColors.white,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    );
    final ButtonStyle defaultButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.red,
      primary: buttonColor,
      // minimumSize: Size(width, height),
   
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
    );
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle ?? defaultButtonStyle,
        child: hasIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: titleStyle ?? style,
                  ),
                  SpaceW8(),
                  Icon(
                    iconData,
                    size: iconSize,
                    color: iconColor,
                  )
                ],
              )
            : Text(
                title,
                style: titleStyle ?? style,
              ),
      ),
    );
  }
}
