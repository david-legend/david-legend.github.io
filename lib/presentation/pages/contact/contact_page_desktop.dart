//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:aerium/application/email/email_bloc.dart';
//import 'package:aerium/core/layout/adaptive.dart';
//import 'package:aerium/core/utils/functions.dart';
//import 'package:aerium/presentation/pages/contact/contact_page.dart';
//import 'package:aerium/presentation/widgets/contact_form.dart';
//import 'package:aerium/presentation/widgets/contact_info.dart';
//import 'package:aerium/presentation/widgets/content_wrapper.dart';
//import 'package:aerium/presentation/widgets/menu_list.dart';
//import 'package:aerium/presentation/widgets/socials.dart';
//import 'package:aerium/presentation/widgets/spaces.dart';
//import 'package:aerium/presentation/widgets/trailing_info.dart';
//import 'package:aerium/values/values.dart';
//
//class ContactPageDesktop extends StatefulWidget {
//  @override
//  _ContactPageDesktopState createState() => _ContactPageDesktopState();
//}
//
//class _ContactPageDesktopState extends State<ContactPageDesktop> {
//  EmailBloc _emailBloc;
//  TextEditingController _emailController;
//  TextEditingController _messageController;
//  TextEditingController _phoneNumberController;
//  TextEditingController _nameController;
//
//  @override
//  void initState() {
//    _emailBloc = BlocProvider.of<EmailBloc>(context);
//    _emailController = TextEditingController();
//    _messageController = TextEditingController();
//    _phoneNumberController = TextEditingController();
//    _nameController = TextEditingController();
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    ThemeData theme = Theme.of(context);
//    return Scaffold(
//      body: Container(
//        child: Stack(
//          children: <Widget>[
//            Container(
//              child: Column(
//                children: <Widget>[
//                  Row(
//                    children: <Widget>[
//                      ContentWrapper(
//                        width: assignWidth(context: context, fraction: 0.20),
//                        color: AppColors.primaryColor,
//                        child: Container(
//                          margin: EdgeInsets.only(
//                            left: Sizes.MARGIN_20,
//                            top: Sizes.MARGIN_20,
//                            bottom: Sizes.MARGIN_20,
//                          ),
//                          child: MenuList(
//                            menuList: Data.menuList,
//                            selectedItemRouteName: ContactPage.contactPageRoute,
//                          ),
//                        ),
//                      ),
//                      ContentWrapper(
//                        width: assignWidth(context: context, fraction: 0.8),
//                        color: AppColors.secondaryColor,
//                        child: Row(
//                          children: [
//                            SizedBox(
//                              width: assignWidth(
//                                context: context,
//                                fraction: 0.025,
//                              ),
//                            ),
//                            Container(
//                              width:
//                                  assignWidth(context: context, fraction: 0.4),
//                              child: contactInfo(),
//                            ),
//                            SizedBox(
//                              width: assignWidth(
//                                context: context,
//                                fraction: 0.025,
//                              ),
//                            ),
//                            TrailingInfo(
//                              width: assignWidth(
//                                context: context,
//                                fraction: 0.35,
//                              ),
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              color: AppColors.primaryColor,
//                              leadingWidget: Text(
//                                StringConst.MESSAGE_ME,
//                                style: theme.textTheme.headline4.copyWith(
//                                  color: AppColors.grey100,
//                                ),
//                              ),
//                              middleWidget: ContactForm(
//                                maxLines: 15,
//                                controllers: [
//                                  _nameController,
//                                  _phoneNumberController,
//                                  _emailController,
//                                  _messageController,
//                                ],
//                                padding: EdgeInsets.only(
//                                  left: assignWidth(
//                                    context: context,
//                                    fraction: 0.025,
//                                  ),
//                                ),
//                              ),
//                              trailingWidget: SendMessageButton(
//                                onPressed: () => sendEmail(),
//                              ),
//                              spacingWidget:
//                                  isDisplaySmallDesktopOrIpadPro(context)
//                                      ? SpaceH30()
//                                      : SpaceH44(),
//                            )
//                          ],
//                        ),
//                      )
//                    ],
//                  )
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget contactInfo() {
//    ThemeData theme = Theme.of(context);
//    return Container(
//      padding: EdgeInsets.only(
//        top: Sizes.PADDING_60,
//        bottom: Sizes.PADDING_20,
//      ),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: [
//          Text(
//            StringConst.GET_IN_TOUCH,
//            style: theme.textTheme.headline3.copyWith(
//              color: AppColors.accentColor2,
//            ),
//          ),
//          SpaceH20(),
//          ContactInfo(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            iconsMainAxisAlignment: MainAxisAlignment.center,
//            iconSize: Sizes.ICON_SIZE_30,
//            onTap: () {},
//          ),
//          SpaceH20(),
//          SpaceH12(),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: [
//              SocialButton(
//                alignment: Alignment.centerLeft,
//                icon: FontAwesomeIcons.linkedin,
//                color: AppColors.black,
//                iconSize: Sizes.ICON_SIZE_36,
//                onPressed: () {
//                  Functions.launchUrl(StringConst.LINKED_IN_URL);
//                },
//              ),
//              SpaceW12(),
//              SocialButton(
//                alignment: Alignment.centerLeft,
//                icon: FontAwesomeIcons.twitter,
//                color: AppColors.black,
//                iconSize: Sizes.ICON_SIZE_36,
//                onPressed: () {
//                  Functions.launchUrl(StringConst.TWITTER_URL);
//                },
//              ),
//              SpaceW12(),
//              SocialButton(
//                alignment: Alignment.centerLeft,
//                icon: FontAwesomeIcons.instagram,
//                color: AppColors.black,
//                iconSize: Sizes.ICON_SIZE_36,
//                onPressed: () {
//                  Functions.launchUrl(StringConst.INSTAGRAM_URL);
//                },
//              ),
//              SpaceW12(),
//              SocialButton(
//                alignment: Alignment.centerLeft,
//                icon: FontAwesomeIcons.telegram,
//                color: AppColors.black,
//                iconSize: Sizes.ICON_SIZE_36,
//                onPressed: () {
//                  Functions.launchUrl(StringConst.TELEGRAM_URL);
//                },
//              ),
//            ],
//          )
//        ],
//      ),
//    );
//  }
//
//  void sendEmail() {
//    _emailBloc.add(
//      EmailEvent.sendEmail(
//        email: _emailController.text,
//        message: _messageController.text,
//        phoneNumber: _phoneNumberController.text,
//        name: _nameController.text,
//      ),
//    );
//  }
//}
