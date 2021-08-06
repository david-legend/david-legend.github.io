import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/widgets/animated_footer.dart';
import 'package:aerium/presentation/pages/works_page/widgets/works_page_header.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/presentation/widgets/project_item.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class WorksPage extends StatelessWidget {
  static const String worksPageRoute = StringConst.WORKS_PAGE;
  const WorksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double projectItemHeight = assignHeight(context, 0.4);
    double subHeightHeight = (3 / 4 )* projectItemHeight;
    return PageWrapper(
      selectedRoute: WorksPage.worksPageRoute,
      selectedPageName: StringConst.WORKS,
      hasSideTitle: false,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          WorksPageHeader(),
          Stack(
            children: [
              ..._buildProjects(
                data: Data.projectItemData,
                projectHeight: projectItemHeight.toInt(),
                subHeight: subHeightHeight.toInt(),
              ),
              // ProjectItemLg(
              //   projectNumber: "01",
              //   projectItemheight: projectItemHeight,
              //   subheight: subHeightHeight,
              //   backgroundColor: AppColors.accentColor2.withOpacity(0.35),
              //   title: "booz player",
              //   subtitle: "UI / UX",
              //   containerColor: Colors.amber,
              // )
            ],
          ),
          AnimatedFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildProjects({
    required List<ProjectItemData> data,
    required int projectHeight,
    required int subHeight,
  }) {
    List<Widget> items = [];
    int margin = subHeight * (data.length - 1);
    for (int index = data.length-1; index >= 0; index--) {
      items.add(
        Container(
          margin: EdgeInsets.only(top: margin.toDouble()),
          child: ProjectItemLg(
            projectNumber: "0$index",
            imageUrl: data[index].image,
            projectItemheight: projectHeight.toDouble(),
            subheight: subHeight.toDouble(),
            backgroundColor: AppColors.accentColor2.withOpacity(0.35),
            title: data[index].title,
            subtitle: "UI / UX",//data[index].subtitle,
            containerColor: Colors.amber,
          ),
        ),
      );
      margin -= subHeight;
    }
    return items;
  }
}
