import 'package:aerium/core/utils/extensions.dart';
import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets/aerium_button.dart';
import 'package:aerium/presentation/widgets/aerium_text_form_field.dart';
import 'package:aerium/presentation/widgets/content_area.dart';
import 'package:aerium/presentation/widgets/custom_spacer.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  static const String contactPageRoute = StringConst.CONTACT_PAGE;
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool _nameFilled = false;
  bool _emailFilled = false;
  bool _subjectFilled = false;
  bool _messageFilled = false;
  bool _nameHasError = false;
  bool _emailHasError = false;
  bool _subjectHasError = false;
  bool _messageHasError = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? initialErrorStyle = textTheme.bodyText1?.copyWith(
      color: AppColors.white,
      fontSize: 12,
    );
    TextStyle? errorStyle = textTheme.bodyText1?.copyWith(
      color: AppColors.errorRed,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 1,
    );

    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double contentAreaWidth = assignWidth(context, 0.6); //takes 60% of screen

    double buttonWidth = responsiveSize(
        context, contentAreaWidth * 0.5, contentAreaWidth * 0.25);
    EdgeInsetsGeometry paddingLg = EdgeInsets.only(
      left: assignWidth(context, 0.15),
      right: assignWidth(context, 0.25),
      top: assignHeight(context, 0.3),
    );
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: paddingLg,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConst.GET_IN_TOUCH,
                    style: textTheme.headline2?.copyWith(
                      color: AppColors.black,
                      fontSize: responsiveSize(context, 40, 60),
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.05),
                  Text(
                    StringConst.CONTACT_MSG,
                    style: textTheme.bodyText1?.copyWith(
                      color: AppColors.grey700,
                      height: 2.0,
                      fontSize: responsiveSize(
                        context,
                        Sizes.TEXT_SIZE_16,
                        Sizes.TEXT_SIZE_18,
                      ),
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.05),
                  AeriumTextFormField(
                    hasTitle: _nameHasError,
                    title: StringConst.NAME_ERROR_MSG,
                    titleStyle: _nameHasError ? errorStyle : initialErrorStyle,
                    hintText: StringConst.YOUR_NAME,
                    controller: _nameController,
                    filled: _nameFilled,
                    onChanged: (value) {
                      isNameValid(value);
                    },
                  ),
                  SpaceH20(),
                  AeriumTextFormField(
                    hasTitle: _emailHasError,
                    title: StringConst.EMAIL_ERROR_MSG,
                    titleStyle: _emailHasError ? errorStyle : initialErrorStyle,
                    hintText: StringConst.EMAIL,
                    controller: _emailController,
                    filled: _emailFilled,
                    onChanged: (value) {
                      isEmailValid(value);
                    },
                  ),
                  SpaceH20(),
                  AeriumTextFormField(
                    hasTitle: _subjectHasError,
                    title: StringConst.SUBJECT_ERROR_MSG,
                    titleStyle:
                        _subjectHasError ? errorStyle : initialErrorStyle,
                    hintText: StringConst.SUBJECT,
                    controller: _subjectController,
                    filled: _subjectFilled,
                    onChanged: (value) {
                      isSubjectValid(value);
                    },
                  ),
                  SpaceH20(),
                  AeriumTextFormField(
                    hasTitle: _messageHasError,
                    title: StringConst.MESSAGE_ERROR_MSG,
                    titleStyle:
                        _messageHasError ? errorStyle : initialErrorStyle,
                    hintText: StringConst.MESSAGE,
                    controller: _messageController,
                    filled: _messageFilled,
                    textInputType: TextInputType.multiline,
                    maxLines: 10,
                    onChanged: (value) {
                      isMessageValid(value);
                    },
                  ),
                  SpaceH20(),
                  Align(
                    alignment: Alignment.topRight,
                    child: AeriumButton(
                      height: Sizes.HEIGHT_50,
                      width: buttonWidth,
                      title: StringConst.SEND_MESSAGE.toUpperCase(),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          SimpleFooter(),
        ],
      ),
    );
  }

  bool isTextValid(String value) {
    if (value.length > 0) {
      return true;
    }
    return false;
  }

  void isNameValid(String name) {
    bool isValid = isTextValid(name);
    setState(() {
      _nameFilled = isValid;
      _nameHasError = !isValid;
    });
  }

  void isEmailValid(String email) {
    bool isValid = email.isValidEmail();
    setState(() {
      _emailFilled = isValid;
      _emailHasError = !isValid;
    });
  }

  void isSubjectValid(String subject) {
    bool isValid = isTextValid(subject);
    setState(() {
      _subjectFilled = isValid;
      _subjectHasError = !isValid;
    });
  }

  void isMessageValid(String message) {
    bool isValid = isTextValid(message);
    setState(() {
      _messageFilled = isValid;
      _messageHasError = !isValid;
    });
  }
}
