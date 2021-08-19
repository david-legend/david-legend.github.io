import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/pages/home/widgets/home_page_header.dart';
import 'package:aerium/presentation/pages/home/widgets/loading_page.dart';
import 'package:aerium/presentation/pages/widgets/animated_footer.dart';
import 'package:aerium/presentation/pages/works/works_page.dart';
import 'package:aerium/presentation/widgets/animated_positioned_text.dart';
import 'package:aerium/presentation/widgets/animated_slide_transtion.dart';
import 'package:aerium/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:aerium/presentation/widgets/custom_spacer.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/presentation/widgets/project_item.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:aerium/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  static const String homePageRoute = StringConst.HOME_PAGE;

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  GlobalKey key = GlobalKey();
  ScrollController _scrollController = ScrollController();
  late AnimationController _viewProjectsController;
  late AnimationController _recentWorksController;
  late AnimationController _slideTextController;
  late NavigationArguments _arguments;

  @override
  void initState() {
    _arguments = NavigationArguments();
    _viewProjectsController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _slideTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _recentWorksController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
   
    super.initState();
  }

  void getArguments() {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    // if page is being loaded for the first time, args will be null.
    // if args is null, I set boolean values to run the appropriate animation
    // In this case, if null run loading animation, if not null run the unveil animation
    if (args == null) {
      _arguments.showUnVeilPageAnimation = false;
    } else {
      _arguments = args as NavigationArguments;
    }
  }

  @override
  void dispose() {
    _viewProjectsController.dispose();
    _slideTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getArguments();
    double projectItemHeight = assignHeight(context, 0.4);
    double subHeight = (3 / 4) * projectItemHeight;
    double extra = projectItemHeight - subHeight;
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? textButtonStyle = textTheme.headline4?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(context, 30, 40, md: 36, sm: 32),
      height: 2.0,
    );
    EdgeInsets margin = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
        sm: assignWidth(context, 0.15),
      ),
    );
    return PageWrapper(
      selectedRoute: HomePage.homePageRoute,
      selectedPageName: StringConst.HOME,
      navBarAnimationController: _slideTextController,
      hasSideTitle: false,
      hasUnveilPageAnimation: _arguments.showUnVeilPageAnimation,
      onLoadingAnimationDone: () {
        _slideTextController.forward();
      },
      customLoadingAnimation: LoadingHomePageAnimation(
        text: StringConst.DEV_NAME,
        style: textTheme.headline4!.copyWith(color: AppColors.white),
        onLoadingDone: () {
          _slideTextController.forward();
        },
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          
          HomePageHeader(
            controller: _slideTextController,
            scrollToWorksKey: key,
          ),
          CustomSpacer(heightFactor: 0.1),
          VisibilityDetector(
            key: Key('recent-projects'),
            onVisibilityChanged: (visibilityInfo) {
              double visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage > 45) {
                _recentWorksController.forward();
              }
            },
            child: Container(
              key: key,
              margin: margin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedTextSlideBoxTransition(
                    controller: _recentWorksController,
                    text: StringConst.CRAFTED_WITH_LOVE,
                    textStyle: textTheme.headline4?.copyWith(
                      color: AppColors.black,
                      fontSize: responsiveSize(context, 30, 48, md: 40, sm: 36),
                      height: 2.0,
                    ),
                  ),
                  SpaceH16(),
                  AnimatedPositionedText(
                    controller: CurvedAnimation(
                      parent: _recentWorksController,
                      curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                    ),
                    text: StringConst.SELECTION,
                    textStyle: textTheme.bodyText1?.copyWith(
                      fontSize: responsiveSize(
                        context,
                        Sizes.TEXT_SIZE_16,
                        Sizes.TEXT_SIZE_18,
                      ),
                      height: 2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.1),
          ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double screenWidth = sizingInformation.screenSize.width;

              if (screenWidth <= RefinedBreakpoints().tabletSmall) {
                return Column(
                  children: _buildProjectsForMobile(
                    data: Data.recentWorks,
                    projectHeight: projectItemHeight.toInt(),
                    subHeight: subHeight.toInt(),
                  ),
                );
              } else {
                return Container(
                  height: (subHeight * (Data.recentWorks.length)) + extra,
                  child: Stack(
                    children: _buildRecentProjects(
                      data: Data.recentWorks,
                      projectHeight: projectItemHeight.toInt(),
                      subHeight: subHeight.toInt(),
                    ),
                  ),
                );
              }
            },
          ),
          CustomSpacer(heightFactor: 0.05),
          Container(
            margin: margin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConst.THERES_MORE.toUpperCase(),
                  style: textTheme.bodyText1?.copyWith(
                    fontSize: responsiveSize(context, 11, Sizes.TEXT_SIZE_12),
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SpaceH16(),
                MouseRegion(
                  onEnter: (e) => _viewProjectsController.forward(),
                  onExit: (e) => _viewProjectsController.reverse(),
                  child: AnimatedSlideTranstion(
                    controller: _viewProjectsController,
                    beginOffset: Offset(0, 0),
                    targetOffset: Offset(0.05, 0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, WorksPage.worksPageRoute);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringConst.VIEW_ALL_PROJECTS.toLowerCase(),
                            style: textButtonStyle,
                          ),
                          SpaceW12(),
                          Container(
                            margin: EdgeInsets.only(
                                top: textButtonStyle!.fontSize! / 2),
                            child: Image.asset(
                              ImagePath.ARROW_RIGHT,
                              width: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          AnimatedFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildRecentProjects({
    required List<ProjectItemData> data,
    required int projectHeight,
    required int subHeight,
  }) {
    List<Widget> items = [];
    int margin = subHeight * (data.length - 1);
    for (int index = data.length - 1; index >= 0; index--) {
      items.add(
        Container(
          margin: EdgeInsets.only(top: margin.toDouble()),
          child: ProjectItemLg(
            projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
            imageUrl: data[index].image,
            projectItemheight: projectHeight.toDouble(),
            subheight: subHeight.toDouble(),
            backgroundColor: AppColors.accentColor2.withOpacity(0.35),
            title: data[index].title.toLowerCase(),
            subtitle: data[index].category,
            containerColor: data[index].primaryColor,
            onTap: () {
              Functions.navigateToProject(
                context: context,
                dataSource: data,
                currentProject: data[index],
                currentProjectIndex: index,
              );
            },
          ),
        ),
      );
      margin -= subHeight;
    }
    return items;
  }

  List<Widget> _buildProjectsForMobile({
    required List<ProjectItemData> data,
    required int projectHeight,
    required int subHeight,
  }) {
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        Container(
          child: ProjectItemSm(
            projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
            imageUrl: data[index].image,
            title: data[index].title.toLowerCase(),
            subtitle: data[index].category,
            containerColor: data[index].primaryColor,
            onTap: () {
              Functions.navigateToProject(
                context: context,
                dataSource: data,
                currentProject: data[index],
                currentProjectIndex: index,
              );
            },
          ),
        ),
      );
      items.add(CustomSpacer(
        heightFactor: 0.10,
      ));
    }
    return items;
  }
}
