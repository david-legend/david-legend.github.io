import 'package:flutter/material.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';

import 'circular_container.dart';
import 'custom_text_form_field.dart';

class ContactForm extends StatelessWidget {
  ContactForm({
    this.padding,
    this.maxLines = 12,
    this.controllers,
  });

  final EdgeInsetsGeometry? padding;
  final List<TextEditingController>? controllers;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        children: [
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
            hintText: StringConst.NAME_HINT_TEXT,
            controller: controllers![0],
          ),
          SpaceH16(),
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
            hintText: StringConst.PHONE_HINT_TEXT,
            textInputType: TextInputType.phone,
            controller: controllers![1],
          ),
          SpaceH16(),
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
            hintText: StringConst.EMAIL_HINT_TEXT,
            textInputType: TextInputType.emailAddress,
            controller: controllers![2],
          ),
          SpaceH16(),
          CustomTextFormField(
            filled: true,
            fillColor: AppColors.grey100,
            hintText: StringConst.MESSAGE_HINT_TEXT,
            maxLines: maxLines,
            controller: controllers![3],
          ),
        ],
      ),
    );
  }
}

class SendMessageButton extends StatelessWidget {
  SendMessageButton({
    this.message = StringConst.SEND_MESSAGE,
    this.onPressed,
  });

  final String message;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FlatButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: theme.textTheme.headline6!.copyWith(color: AppColors.grey100),
          ),
          SpaceW12(),
          CircularContainer(
            child: Icon(
              Icons.send,
              color: AppColors.secondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
