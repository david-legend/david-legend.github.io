import 'package:aerium/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:aerium/app_theme.dart';
import 'package:aerium/presentation/pages/home/home_page.dart';
import 'package:aerium/presentation/routes/routes.dart';
import 'package:aerium/values/values.dart';
import 'package:layout/layout.dart';

import 'configure_web.dart';

// Home
// TODO:: add well rounded verbose rotating logos -> representing web, mobile & cloud
// cloud -> kubernets & docker
// mobile -> kotlin, android, flutter, jetpack compose,
// web -> react, javascript


// Certifications
// TODO:: Add Cloud Certification from Udacity

// Contact
// TODO:: Fix email service


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
   configureApp();
  runApp(Aerium());
}

class Aerium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: StringConst.APP_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.homePageRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}


