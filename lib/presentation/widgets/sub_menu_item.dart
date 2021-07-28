import 'package:flutter/material.dart';
import 'package:aerium/presentation/widgets/spaces.dart';

// ignore: must_be_immutable
class SubMenuItem extends StatelessWidget {
  SubMenuItem({
    required this.title,
    this.isSelected = false,
    this.textStyle,
    this.color,
    this.thickness,
  });

  final String title;
  bool? isSelected;
  final Color? color;
  final double? thickness;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedOpacity(
              opacity: isSelected! ? 1 : 0.0,
              duration: Duration(milliseconds: 300),
              child: VerticalDivider(
                color: color,
                thickness: thickness,
              ),
            ),
            isSelected! ? SpaceW8() : Container(),
            Text(
              title,
              style: textStyle ?? theme.textTheme.headline6!.copyWith(),
            )
          ],
        ),
      ),
    );
  }
}
