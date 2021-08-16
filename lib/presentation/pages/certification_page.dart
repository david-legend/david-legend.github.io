import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/pages/widgets/page_header.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets/certification_card.dart';
import 'package:aerium/presentation/widgets/content_area.dart';
import 'package:aerium/presentation/widgets/custom_spacer.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CertificationPage extends StatefulWidget {
  static const String certificationPageRoute = StringConst.CERTIFICATION_PAGE;
  const CertificationPage({Key? key}) : super(key: key);

  @override
  _CertificationPageState createState() => _CertificationPageState();
}

class _CertificationPageState extends State<CertificationPage>
    with TickerProviderStateMixin {
  late AnimationController _certificationsController;
  late AnimationController _headingTextController;

  @override
  void initState() {
    _certificationsController = AnimationController(
      duration: Animations.slideAnimationDurationShort,
      vsync: this,
    );
    _headingTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );

    super.initState();
  }

  @override
  void dispose() {
    _headingTextController.dispose();
    _certificationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double spacing = assignWidth(context, 0.05);
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.7),
      sm: assignWidth(context, 0.8),
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
        sm: assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
        sm: assignWidth(context, 0.10),
      ),
    );
    return PageWrapper(
      selectedRoute: CertificationPage.certificationPageRoute,
      selectedPageName: StringConst.CERTIFICATIONS,
      navBarAnimationController: _headingTextController,
      onLoadingAnimationDone: () {
        _headingTextController.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          PageHeader(
            headingText: StringConst.CERTIFICATIONS,
            headingTextController: _headingTextController,
          ),
          VisibilityDetector(
            key: Key('certifications'),
            onVisibilityChanged: (visibilityInfo) {
              double visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage > 40) {
                _certificationsController.forward();
              }
            },
            child: Padding(
              padding: padding,
              child: ContentArea(
                width: contentAreaWidth,
                child: AnimatedBuilder(
                  animation: _certificationsController,
                  builder: (context, child) {
                    return Wrap(
                      direction: Axis.horizontal,
                      spacing: assignWidth(context, 0.05),
                      runSpacing: assignHeight(context, 0.02),
                      children: _certificateList(
                        data: Data.certificationData,
                        width: contentAreaWidth,
                        spacing: spacing,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          SimpleFooter(),
        ],
      ),
    );
  }


  List<Widget> _certificateList({
    required List<CertificationData> data,
    required double width,
    required double spacing,
  }) {
    List<Widget> widgets = [];
    double duration =
        _certificationsController.duration!.inMilliseconds.roundToDouble();
    double durationForEachPortfolio =
        _certificationsController.duration!.inMilliseconds.roundToDouble() /
            data.length;

    for (var i = 0; i < data.length; i++) {
      double start = durationForEachPortfolio * i;
      double end = durationForEachPortfolio * (i + 1);
      widgets.add(
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(
            CurvedAnimation(
              parent: _certificationsController,
              curve: Interval(
                start > 0.0 ? start / duration : 0.0,
                end > 0.0 ? end / duration : 1.0,
                curve: Curves.easeIn,
              ),
            ),
          ),
          child: CertificationCard(
            imageUrl: data[i].image,
            onTap: () => _viewCertificate(data[i].url),
            title: data[i].title,
            subtitle: data[i].awardedBy,
            actionTitle: StringConst.VIEW,
            isMobileOrTablet: isDisplayMobileOrTablet(context) ? true : false,
            height: isDisplayMobile(context)
                ? assignHeight(context, 0.40)
                : assignHeight(context, 0.45),
            width: isDisplayMobile(context)
                ? assignWidth(
                    context,
                    0.8,
                  )
                : (width - spacing) / 2,
          ),
        ),
      );
    }
    return widgets;
  }

  void _viewCertificate(String url) {
    Functions.launchUrl(url);
  }
}
