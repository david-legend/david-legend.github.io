import 'package:flutter/material.dart';
import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/pages/certification/certification_page.dart';
import 'package:aerium/presentation/widgets/app_drawer.dart';
import 'package:aerium/presentation/widgets/content_wrapper.dart';
import 'package:aerium/presentation/widgets/custom_app_bar.dart';
import 'package:aerium/presentation/widgets/portfolio_card.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';

class CertificationPageMobile extends StatefulWidget {
  @override
  _CertificationPageMobileState createState() =>
      _CertificationPageMobileState();
}

class _CertificationPageMobileState extends State<CertificationPageMobile>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late AnimationController _certificationController;

  @override
  void initState() {
    _certificationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _playPortfolioAnimation();
    super.initState();
  }

  Future<void> _playPortfolioAnimation() async {
    try {
      await _certificationController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  void dispose() {
    _certificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double duration =
        _certificationController.duration!.inMilliseconds.roundToDouble();
    double durationForEachPortfolio =
        _certificationController.duration!.inMilliseconds.roundToDouble() /
            Data.certificationData.length;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: CustomAppBar(
          title: StringConst.CERTIFICATIONS,
          onLeadingPressed: () {
            if (_scaffoldKey.currentState!.isEndDrawerOpen) {
              _scaffoldKey.currentState!.openEndDrawer();
            } else {
              _scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
      ),
      drawer: AppDrawer(
        menuList: Data.menuList,
        selectedItemRouteName: CertificationPage.certificationPageRoute,
      ),
      body: ContentWrapper(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_24,
            vertical: Sizes.PADDING_16,
          ),
          itemCount: Data.certificationData.length,
          separatorBuilder: (BuildContext context, index) {
            return SpaceH20();
          },
          itemBuilder: (BuildContext context, index) {
            double start = durationForEachPortfolio * index;
            double end = durationForEachPortfolio * (index + 1);
            return AnimatedBuilder(
              animation: _certificationController,
              child: PortfolioCard(
                imageUrl: Data.certificationData[index].image,
                onTap: () =>
                    _viewCertificate(Data.certificationData[index].url),
                title: Data.certificationData[index].title,
                subtitle: Data.certificationData[index].awardedBy,
                actionTitle: StringConst.VIEW,
                height: assignHeight(context: context, fraction: 0.35),
                width: widthOfScreen(context),
              ),
              builder: (BuildContext context, Widget? child) {
                return FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(
                    CurvedAnimation(
                      parent: _certificationController,
                      curve: Interval(
                        start > 0.0 ? start / duration : 0.0,
                        end > 0.0 ? end / duration : 1.0,
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  child: child,
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _viewCertificate(String url) {
    Functions.launchUrl(url);
  }
}
