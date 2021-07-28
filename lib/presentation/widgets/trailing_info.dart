import 'package:flutter/material.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/widgets/circular_container.dart';
import 'package:aerium/values/values.dart';

class TrailingInfo extends StatelessWidget {
  TrailingInfo({
    this.leadingWidget,
    this.middleWidget,
    this.trailingWidget,
    this.spacingWidget,
    this.padding,
    this.info = StringConst.DEV_EMAIL,
    this.width,
    this.onTrailingWidgetPressed,
    this.onLeadingWidgetPressed,
    this.color,
    this.crossAxisAlignment = CrossAxisAlignment.end,
  });

  final Widget? leadingWidget;
  final Widget? middleWidget;
  final Widget? trailingWidget;
  final Widget? spacingWidget;
  final EdgeInsetsGeometry? padding;
  final String info;
  final double? width;
  final Color? color;
  final GestureTapCallback? onTrailingWidgetPressed;
  final GestureTapCallback? onLeadingWidgetPressed;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: width,
      padding: padding ??
          EdgeInsets.only(
            top: Sizes.PADDING_30,
            right: Sizes.PADDING_30,
            bottom: Sizes.PADDING_20,
          ),
      color: color,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          InkWell(
            onTap: onLeadingWidgetPressed ??
                () {
                  Functions.launchUrl(StringConst.EMAIL_URL);
                },
            child: leadingWidget ??
                CircularContainer(
                  width: Sizes.WIDTH_30,
                  height: Sizes.HEIGHT_30,
                  color: AppColors.primaryColor,
                  child: Icon(
                    Icons.email,
                    color: AppColors.secondaryColor,
                    size: Sizes.ICON_SIZE_20,
                  ),
                ),
          ),
          spacingWidget ?? Spacer(flex: 1),
          middleWidget ??
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  info,
                  textAlign: TextAlign.end,
                  style: theme.textTheme.bodyText1!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
          spacingWidget ?? Spacer(flex: 1),
          InkWell(
            onTap: onTrailingWidgetPressed,
            child: trailingWidget ??
                CircularContainer(
                  color: AppColors.primaryColor,
                  width: Sizes.WIDTH_30,
                  height: Sizes.HEIGHT_30,
                  child: Icon(
                    Icons.chevron_right,
                    color: AppColors.secondaryColor,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
