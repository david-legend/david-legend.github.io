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
// TODO:: Add animations for loading noteworthy projects 
// TODO:: Add animation to draw X on homepage
// TODO:: Add animation to show project only when it is visible
// TODO:: Get curves right for animations
// TODO:: Add proper images for projects
// TODO:: Make project Item responsive on tablets
// TODO:: Show link destination in bottom left corner

// Later
// TODO:: Animation for app drawer for mobile view when it opens
// TODO:: Add proper text all over the site
// TODO:: Holla at Julius in footer

// Issues::
// Onhover of project item button, project image leaves
// when you navigate the black cover is still there

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
        initialRoute: HomePage.homePageRoute,
        // initialRoute: WorksPage.worksPageRoute,
        // initialRoute: ContactPage.contactPageRoute,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}
