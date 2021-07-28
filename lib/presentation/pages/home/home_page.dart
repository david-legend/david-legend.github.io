import 'package:flutter/material.dart';
import 'package:aerium/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'home_page_desktop.dart';
import 'home_page_mobile.dart';

class HomePage extends StatelessWidget {
  static const String homePageRoute = StringConst.HOME_PAGE;

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: HomePageMobile(),
        tablet: HomePageDesktop(),
        desktop: HomePageDesktop(),
      ),
    );
  }
}
