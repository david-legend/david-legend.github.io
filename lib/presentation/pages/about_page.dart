import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  static const String aboutPageRoute = StringConst.ABOUT_PAGE;
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      selectedRoute: AboutPage.aboutPageRoute,
      selectedPageName: StringConst.ABOUT,
      child: Container(),
    );
  }
}
