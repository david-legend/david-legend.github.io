import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions {
  static void launchUrl(String url) async {
    await launch(url);
  }

  static NavigationArguments getArguments(BuildContext context) {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    NavigationArguments _arguments = NavigationArguments();

    return _arguments;
    // if page is being loaded for the first time, args will be null.
    // if args is null, I set boolean values to run the appropriate animation
    // In this case, if null run loading animation, if not null run the unveil animation
    // if (args == null) {
    //   _arguments.showUnVeilPageAnimation = false;
    // } else {
    //   _arguments = args as NavigationArguments;
    // }

  }
}
