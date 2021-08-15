import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/project_detail/widgets/about_project.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets/animated_positioned_text.dart';
import 'package:aerium/presentation/widgets/content_area.dart';
import 'package:aerium/presentation/widgets/custom_spacer.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/presentation/widgets/project_item.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class ProjectDetailArguments {
  final ProjectItemData data;

  ProjectDetailArguments({
    required this.data,
  });
}

class ProjectDetailPage extends StatefulWidget {
  static const String projectDetailPageRoute = StringConst.PROJECT_DETAIL_PAGE;
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  _ProjectDetailPageState createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _coverTitleController;
  final Duration duration = Duration(milliseconds: 2000);
  final Duration coverTitleDuration = Duration(milliseconds: 1000);
  late ProjectDetailArguments projectDetails;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
    _coverTitleController = AnimationController(
      vsync: this,
      duration: coverTitleDuration,
    );

    super.initState();
  }

  ProjectDetailArguments getArguments() {
    projectDetails =
        ModalRoute.of(context)!.settings.arguments as ProjectDetailArguments;
    return projectDetails;
  }

  @override
  Widget build(BuildContext context) {
    getArguments();
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? coverTitleStyle = textTheme.headline2?.copyWith(
      color: projectDetails.data.primaryColor,
      fontSize: 40,
    );
    TextStyle? coverSubtitleStyle = textTheme.bodyText1?.copyWith();
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.25),
      ),
      // top: responsiveSize(
      //   context,
      //   assignHeight(context, 0.25),
      //   assignHeight(context, 0.3),
      // ),
    );
    double aboutAreaContentWidth = responsiveSize(
      context,
      assignWidth(context, 0.60),
      assignWidth(context, 0.80),
    );
    return PageWrapper(
      backgroundColor: AppColors.white,
      selectedRoute: ProjectDetailPage.projectDetailPageRoute,
      hasSideTitle: false,
      selectedPageName: StringConst.PROJECT,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: () {
        _controller.forward();
        _coverTitleController.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Container(
            width: widthOfScreen(context),
            height: heightOfScreen(context),
            child: Stack(
              children: [
                Image.asset(
                  projectDetails.data.coverUrl,
                  fit: BoxFit.cover,
                  width: widthOfScreen(context),
                  height: heightOfScreen(context),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedPositionedText(
                        controller: CurvedAnimation(
                          parent: _coverTitleController,
                          curve: Curves.fastOutSlowIn,
                        ),
                        text: projectDetails.data.title,
                        textAlign: TextAlign.center,
                        textStyle: coverTitleStyle,
                      ),
                      SpaceH20(),
                      AnimatedPositionedText(
                        controller: CurvedAnimation(
                          parent: _coverTitleController,
                          curve: Curves.fastOutSlowIn,
                        ),
                        text: projectDetails.data.subtitle,
                        textAlign: TextAlign.center,
                        textStyle: coverSubtitleStyle,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          Padding(
            padding: padding,
            child: ContentArea(
              width: aboutAreaContentWidth,
              child: Aboutproject(
                projectData: projectDetails.data,
                width: aboutAreaContentWidth,
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          // ListView.builder(
          //   physics: NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemCount: projectDetails.data.projectAssets.length,
          //   itemBuilder: (context, index) {
          //     return Image.asset(
          //       projectDetails.data.projectAssets[index],
          //       width: widthOfScreen(context),
          //       fit: BoxFit.cover,
          //     );
          //   },
          // ),
          ..._buildProjectAlbum(projectDetails.data.projectAssets),
          SimpleFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildProjectAlbum(List<String> data) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        Image.asset(
          data[index],
          width: widthOfScreen(context) * 0.3,
          // fit: BoxFit.cover,
        ),
      );
    }

    return items;
  }
}
