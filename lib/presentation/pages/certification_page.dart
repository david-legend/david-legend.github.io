import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/pages/widgets/simple_footer.dart';
import 'package:aerium/presentation/widgets/certification_card.dart';
import 'package:aerium/presentation/widgets/content_area.dart';
import 'package:aerium/presentation/widgets/custom_spacer.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class CertificationPage extends StatefulWidget {
  static const String certificationPageRoute = StringConst.CERTIFICATION_PAGE;
  const CertificationPage({Key? key}) : super(key: key);

  @override
  _CertificationPageState createState() => _CertificationPageState();
}

class _CertificationPageState extends State<CertificationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: AnimatedBuilder(
                animation: _controller,
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
          CustomSpacer(heightFactor: 0.15),
          SimpleFooter(),
        ],
      ),
    );
  }

  Widget _buildAnimation(
      {required double contentWidth, required double spacing}) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Wrap(
          direction: Axis.horizontal,
          spacing: assignWidth(context, 0.05),
          runSpacing: assignHeight(context, 0.02),
          children: _certificateList(
            data: Data.certificationData,
            width: contentWidth,
            spacing: spacing,
          ),
        );
      },
    );
  }

  List<Widget> _certificateList(
      {required List<CertificationData> data,
      required double width,
      required double spacing}) {
    List<Widget> widgets = [];
    double duration = _controller.duration!.inMilliseconds.roundToDouble();
    double durationForEachPortfolio =
        _controller.duration!.inMilliseconds.roundToDouble() / data.length;

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
              parent: _controller,
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
