import 'package:aerium/presentation/pages/about/about_page.dart';
import 'package:aerium/presentation/pages/contact_page.dart';
import 'package:aerium/presentation/pages/experience_page.dart';
import 'package:aerium/presentation/pages/home/widgets/loading_page.dart';
import 'package:aerium/presentation/pages/works/works_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aerium/app_theme.dart';
import 'package:aerium/presentation/pages/home/home_page.dart';
import 'package:aerium/presentation/routes/routes.dart';
import 'package:aerium/values/values.dart';
import 'package:layout/layout.dart';

// Priority
// TODO:: Work on sending email from website
// TODO:: Compute height of box  --> for animation on about & experience page
// TODO:: Show link destination in bottom left corner

// Later
// TODO:: Add proper text all over the site
// TODO:: Make images smaller (reduce quality) and also drop some images to decrease download size

void main() async {
  // GoogleFonts.config.allowRuntimeFetching = false;
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
        // initialRoute: HomePage.homePageRoute,
        initialRoute: WorksPage.worksPageRoute,
        // initialRoute: AboutPage.aboutPageRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}


