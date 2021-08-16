import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/home/home_page.dart';
import 'package:aerium/presentation/pages/widgets/socials.dart';
import 'package:aerium/presentation/widgets/app_logo.dart';
import 'package:aerium/presentation/widgets/nav_item.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({
    required this.menuList,
    required this.selectedItemRouteName,
    required this.controller,
    this.color = AppColors.black,
    this.width,
    this.onClose,
  });

  final String selectedItemRouteName;
  final List<NavItemData> menuList;
  final Color color;
  final AnimationController controller;
  final double? width;
  final GestureTapCallback? onClose;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  static const Duration _initialDelayTime = Duration(milliseconds: 50);
  static const Duration _itemSlideTime = Duration(milliseconds: 400);
  static const Duration _staggerTime = Duration(milliseconds: 50);
  static const Duration _buttonDelayTime = Duration(milliseconds: 100);
  static const Duration _buttonTime = Duration(milliseconds: 400);
  late Duration _animationDuration;

  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];

  @override
  void initState() {
    _animationDuration = _initialDelayTime +
        (_staggerTime * widget.menuList.length) +
        _buttonDelayTime +
        _buttonTime;
    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
    super.initState();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < widget.menuList.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyText1?.copyWith(
      color: AppColors.grey500,
      fontSize: Sizes.TEXT_SIZE_10,
    );
    return Container(
      width: widget.width ?? widthOfScreen(context),
      height: heightOfScreen(context),
      child: Drawer(
        child: Container(
          color: widget.color,
          width: widget.width ?? widthOfScreen(context),
          height: heightOfScreen(context),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(Sizes.PADDING_24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppLogo(
                          fontSize: Sizes.TEXT_SIZE_40,
                          titleColor: AppColors.accentColor,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: widget.onClose ??
                              () {
                                Navigator.pop(context);
                              },
                          child: Icon(
                            FeatherIcons.x,
                            size: Sizes.ICON_SIZE_30,
                            color: AppColors.accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(flex: 2),
                        ..._buildMenuList(
                            menuList: widget.menuList, context: context),
                        Spacer(flex: 2),
                      ],
                    ),
                  ),
                  Text(
                    StringConst.COPYRIGHT,
                    style: style,
                  ),
                  SpaceH20(),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(
                    left: Sizes.MARGIN_24,
                    bottom: assignHeight(context, 0.1),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Socials(
                      socialData: Data.socialData,
                      size: 18,
                      isHorizontal: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildMenuList({
    required BuildContext context,
    required List<NavItemData> menuList,
  }) {
    List<Widget> menuItems = [];
    for (var index = 0; index < menuList.length; index++) {
      menuItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[index].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: NavItem(
            controller: widget.controller,
            onTap: () {
              if (menuList[index].route == HomePage.homePageRoute) {
                Navigator.of(context).pushNamed(
                  menuList[index].route,
                  arguments: NavigationArguments(
                    showUnVeilPageAnimation: true,
                  ),
                );
              } else {
                Navigator.of(context).pushNamed(menuList[index].route);
              }
            },
            index: index + 1,
            route: menuList[index].route,
            title: menuList[index].name,
            isMobile: true,
            isSelected: widget.selectedItemRouteName == menuList[index].route
                ? true
                : false,
          ),
        ),
      );
    }
    return menuItems;
  }
}
