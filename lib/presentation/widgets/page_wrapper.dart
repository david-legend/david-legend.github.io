import 'package:aerium/presentation/pages/widgets/nav_bar.dart';
import 'package:aerium/presentation/widgets/app_drawer.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class PageWrapper extends StatefulWidget {
  PageWrapper({
    Key? key,
    required this.selectedRoute,
    required this.selectedPageName,
    required this.child,
  }) : super(key: key);

  final String selectedRoute;
  final String selectedPageName;
  final Widget child;

  @override
  _PageWrapperState createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        menuList: Data.menuItems,
        selectedItemRouteName: widget.selectedRoute,
      ),
      body: Stack(
        children: [
          widget.child,
          NavBar(
            selectedRouteTitle: widget.selectedPageName,
            selectedRouteName: widget.selectedRoute,
            onMenuTap: () {
              if (_scaffoldKey.currentState!.isEndDrawerOpen) {
                _scaffoldKey.currentState?.openEndDrawer();
              } else {
                _scaffoldKey.currentState?.openDrawer();
              }
            },
          ),
        ],
      ),
    );
  }
}
