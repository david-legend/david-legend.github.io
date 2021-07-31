import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets/aerium_button.dart';
import 'package:aerium/presentation/widgets/nav_item.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      "DL",
      style: textTheme.headline2?.copyWith(
        color: AppColors.black,
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  NavBar({
    Key? key,
    required this.selectedRouteTitle,
    required this.selectedRouteName,
    this.selectedRouteTitleStyle,
  }) : super(key: key);

  final String selectedRouteTitle;
  final TextStyle? selectedRouteTitleStyle;
  final String selectedRouteName;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_40,
        vertical: Sizes.PADDING_24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppLogo(),
              Spacer(),
              ..._buildNavItems(context, menuList: Data.menuItems),
              AeriumButton(
                height: Sizes.HEIGHT_36,
                hasIcon: false,
                width: 80,
                buttonColor: AppColors.white,
                borderColor: AppColors.black,
                onHoverColor: AppColors.black,
                title: StringConst.RESUME.toUpperCase(),
                onPressed: () {},
              ),
            ],
          ),
          Spacer(),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              selectedRouteTitle.toUpperCase(),
              style: selectedRouteTitleStyle ??
                  textTheme.bodyText1?.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: Sizes.TEXT_SIZE_12,
                  ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems(BuildContext context,
      {required List<NavItemData> menuList}) {
    List<Widget> items = [];
    for (int index = 0; index < menuList.length; index++) {
      items.add(
        NavItem(
          title: menuList[index].name,
          route: menuList[index].route,
          isSelected: menuList[index].route == selectedRouteName ? true : false,
          onTap: () {
            Navigator.of(context).pushNamed(menuList[index].route);
          },
        ),
      );
      items.add(SpaceW24());
    }
    return items;
  }
}
