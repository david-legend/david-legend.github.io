//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:aerium/application/email/email_bloc.dart';
//import 'package:aerium/core/utils/functions.dart';
//import 'package:aerium/presentation/pages/contact/contact_page.dart';
//import 'package:aerium/presentation/widgets/app_drawer.dart';
//import 'package:aerium/presentation/widgets/contact_form.dart';
//import 'package:aerium/presentation/widgets/contact_info.dart';
//import 'package:aerium/presentation/widgets/custom_app_bar.dart';
//import 'package:aerium/presentation/widgets/socials.dart';
//import 'package:aerium/presentation/widgets/spaces.dart';
//import 'package:aerium/values/values.dart';
//
//class ContactPageMobile extends StatefulWidget {
//  @override
//  _ContactPageMobileState createState() => _ContactPageMobileState();
//}
//
//class _ContactPageMobileState extends State<ContactPageMobile> {
//  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
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
//
//    return Scaffold(
//      key: _scaffoldKey,
//      backgroundColor: AppColors.deepBlue700,
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(56.0),
//        child: CustomAppBar(
//          title: StringConst.CONTACT,
//          actions: [],
//          onLeadingPressed: () {
//            if (_scaffoldKey.currentState.isEndDrawerOpen) {
//              _scaffoldKey.currentState.openEndDrawer();
//            } else {
//              _scaffoldKey.currentState.openDrawer();
//            }
//          },
//          onActionsPressed: null,
//        ),
//      ),
//      drawer: AppDrawer(
//        menuList: Data.menuList,
//        selectedItemRouteName: ContactPage.contactPageRoute,
//      ),
//      body: ListView(
//        children: [
//          Container(
//            padding: const EdgeInsets.symmetric(
//              horizontal: Sizes.PADDING_16,
//              vertical: Sizes.PADDING_16,
//            ),
//            child: Column(
//              children: [
//                Center(
//                  child: Text(
//                    StringConst.GET_IN_TOUCH,
//                    style: theme.textTheme.headline6.copyWith(
//                      color: AppColors.grey100,
//                    ),
//                  ),
//                ),
//                SpaceH16(),
//                ContactInfo(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  iconsMainAxisAlignment: MainAxisAlignment.center,
//                  iconSize: Sizes.ICON_SIZE_18,
//                  iconColor: AppColors.grey100,
//                  contactTypeTextStyle: theme.textTheme.headline6.copyWith(
//                    color: AppColors.grey100,
//                  ),
//                  contactTextStyle: theme.textTheme.bodyText1.copyWith(
//                    color: AppColors.grey100,
//                  ),
//                  onTap: () {},
//                ),
//                SpaceH20(),
//                Center(
//                  child: Text(
//                    StringConst.MESSAGE_ME,
//                    style: theme.textTheme.headline5.copyWith(
//                      color: AppColors.grey100,
//                    ),
//                  ),
//                ),
//                SpaceH16(),
//                ContactForm(
//                  padding: const EdgeInsets.symmetric(
//                    horizontal: Sizes.PADDING_16,
//                  ),
//                  controllers: [
//                    _nameController,
//                    _phoneNumberController,
//                    _emailController,
//                    _messageController,
//                  ],
//                ),
//                SpaceH30(),
//                SendMessageButton(
//                  onPressed: () => sendEmail(),
//                ),
//                SpaceH20(),
//                Text(
//                  StringConst.CONNECT,
//                  style: theme.textTheme.headline6.copyWith(
//                    color: AppColors.grey100,
//                  ),
//                ),
//                SpaceH12(),
//                _buildSocialButtons(),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget _buildSocialButtons() {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: [
//        SocialButton(
//          alignment: Alignment.centerLeft,
//          icon: FontAwesomeIcons.linkedin,
//          color: AppColors.grey100,
//          onPressed: () {
//            Functions.launchUrl(StringConst.LINKED_IN_URL);
//          },
//        ),
//        SocialButton(
//          alignment: Alignment.centerLeft,
//          icon: FontAwesomeIcons.twitter,
//          color: AppColors.grey100,
//          onPressed: () {
//            Functions.launchUrl(StringConst.TWITTER_URL);
//          },
//        ),
//        SocialButton(
//          alignment: Alignment.centerLeft,
//          icon: FontAwesomeIcons.instagram,
//          color: AppColors.grey100,
//          onPressed: () {
//            Functions.launchUrl(StringConst.INSTAGRAM_URL);
//          },
//        ),
//        SocialButton(
//          alignment: Alignment.centerLeft,
//          icon: FontAwesomeIcons.telegram,
//          color: AppColors.grey100,
//          onPressed: () {
//            Functions.launchUrl(StringConst.TELEGRAM_URL);
//          },
//        ),
//      ],
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
