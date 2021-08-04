import 'package:flutter/material.dart';
import 'package:aerium/values/values.dart';


class HomePage extends StatelessWidget {
  static const String homePageRoute = StringConst.HOME_PAGE;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      key: _scaffoldKey,
      body: Container()
      // ListView(
      //   physics: const BouncingScrollPhysics(
      //     parent: AlwaysScrollableScrollPhysics(),
      //   ),
      // ),
    );
  }
}
