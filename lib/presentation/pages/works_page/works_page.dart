import 'package:aerium/presentation/pages/works_page/widgets/works_page_header.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class WorksPage extends StatelessWidget {
  static const String worksPageRoute = StringConst.WORKS_PAGE;
  const WorksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      selectedRoute: WorksPage.worksPageRoute,
      selectedPageName: StringConst.WORKS,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [

          WorksPageHeader(),
        ],
      ),
    );
  }
}
