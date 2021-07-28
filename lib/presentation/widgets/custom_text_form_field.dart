import 'package:flutter/material.dart';
import 'package:aerium/values/values.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? textFormFieldStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? fieldTitleTextStyle;
  final BorderStyle borderStyle;
  final double borderRadius;
  final double borderWidth;
  final double contentPaddingHorizontal;
  final double contentPaddingVertical;
  final String? hintText;
  final String? fieldTitle;
  final Color fillColor;
  final bool filled;
  final bool obscured;
  final GestureTapCallback? onTap;
  final TextInputType textInputType;
  final FormFieldValidator<String>? validator;
  final int maxLines;
  final InputBorder border;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;

  CustomTextFormField({
    this.controller,
    this.onTap,
    this.textInputType = TextInputType.text,
    this.textFormFieldStyle,
    this.fieldTitleTextStyle,
    this.hintTextStyle,
    this.borderStyle = BorderStyle.none,
    this.borderRadius = Sizes.RADIUS_6,
    this.borderWidth = Sizes.WIDTH_0,
    this.contentPaddingHorizontal = Sizes.SIZE_16,
    this.contentPaddingVertical = Sizes.SIZE_16,
    this.hintText,
    this.fillColor = AppColors.white,
    this.filled = true,
    this.obscured = false,
    this.fieldTitle,
    this.validator,
    this.maxLines = 1,
    this.border = Borders.defaultInputBorder,
    this.focusedBorder = Borders.defaultInputBorder,
    this.enabledBorder = Borders.defaultInputBorder,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      child: TextFormField(
        controller: controller,
        style: textFormFieldStyle ??
            theme.textTheme.subtitle1!.copyWith(color: AppColors.primaryColor),
        validator: validator,
        onTap: onTap,
        autovalidate: true,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: border,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          hintText: hintText,
          hintStyle: hintTextStyle,
          contentPadding: EdgeInsets.symmetric(
            horizontal: contentPaddingHorizontal,
            vertical: contentPaddingVertical,
          ),
          filled: filled,
          fillColor: fillColor,
        ),
        keyboardType: textInputType,
        obscureText: obscured,
      ),
    );
  }
}
