import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aerium/app_theme.dart';
import 'package:aerium/presentation/pages/home/home_page.dart';
import 'package:aerium/presentation/routes/routes.dart';
import 'package:aerium/values/values.dart';


void main() async {
  // GoogleFonts.config.allowRuntimeFetching = false;
  runApp(Aerium());
}

class Aerium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConst.APP_TITLE,
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.homePageRoute,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
