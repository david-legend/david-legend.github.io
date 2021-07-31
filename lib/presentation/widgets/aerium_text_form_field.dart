import 'package:aerium/presentation/widgets/empty.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AeriumTextFormField extends StatelessWidget {
  AeriumTextFormField({
    Key? key,
    this.title = '',
    this.titleStyle,
    this.hasTitle = true,
    this.textStyle,
    this.hintTextStyle,
    this.labelStyle,
    this.contentPadding,
    this.border = Borders.primaryInputBorder,
    this.focusedBorder = Borders.focusedBorder,
    this.enabledBorder = Borders.enabledBorder,
    this.hintText,
    this.labelText,
    this.obscured = false,
    this.textInputType,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.fillColor = AppColors.lightGreen,
    this.filled = false,
    this.maxLines = 1,
    this.controller,
  }) : super(key: key);

  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelStyle;
  final TextStyle? titleStyle;
  final String title;
  final String? hintText;
  final String? labelText;
  final bool obscured;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder border;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Color fillColor;
  final bool filled;
  final bool hasTitle;
  int? maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasTitle ? Text(title, style: titleStyle) : Empty(),
        TextFormField(
          style: textStyle ??
              textTheme.bodyText1?.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),

          controller: controller,
          keyboardType: textInputType,
          onChanged: onChanged,
          maxLines:maxLines ,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: filled,
            contentPadding: contentPadding,
            labelText: labelText,
            labelStyle: labelStyle,
            border: border,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            hintText: hintText,
            hintStyle: hintTextStyle ??
                textTheme.bodyText1?.copyWith(
                  color: AppColors.grey600,
                ),
          ),
          obscureText: obscured,
        ),
      ],
    );
  }
}
