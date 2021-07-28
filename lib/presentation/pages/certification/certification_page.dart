import 'package:flutter/material.dart';
import 'package:aerium/presentation/pages/certification/certification_page_desktop.dart';
import 'package:aerium/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'certification_page_mobile.dart';

class CertificationPage extends StatelessWidget {
  static const String certificationPageRoute = StringConst.CERTIFICATION_PAGE;

  const CertificationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        mobile: CertificationPageMobile(),
        tablet: CertificationPageDesktop(),
        desktop: CertificationPageDesktop(),
      ),
    );
  }
}
