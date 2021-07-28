import 'package:flutter/material.dart';
import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/core/utils/functions.dart';
import 'package:aerium/presentation/pages/certification/certification_page.dart';
import 'package:aerium/presentation/widgets/content_wrapper.dart';
import 'package:aerium/presentation/widgets/customer_scroller.dart';
import 'package:aerium/presentation/widgets/menu_list.dart';
import 'package:aerium/presentation/widgets/portfolio_card.dart';
import 'package:aerium/presentation/widgets/trailing_info.dart';
import 'package:aerium/values/values.dart';

class CertificationPageDesktop extends StatefulWidget {
  @override
  _CertificationPageDesktopState createState() =>
      _CertificationPageDesktopState();
}

class _CertificationPageDesktopState extends State<CertificationPageDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ContentWrapper(
                    width: assignWidth(
                      context: context,
                      fraction: 0.2,
                    ),
                    color: AppColors.primaryColor,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: Sizes.MARGIN_20,
                        top: Sizes.MARGIN_20,
                        bottom: Sizes.MARGIN_20,
                      ),
                      child: MenuList(
                        menuList: Data.menuList,
                        selectedItemRouteName:
                            CertificationPage.certificationPageRoute,
                      ),
                    ),
                  ),
                  ContentWrapper(
                    width: assignWidth(
                      context: context,
                      fraction: 0.8,
                    ),
                    color: AppColors.grey100,
                    child: Row(
                      children: [
                        Container(
                          width: assignWidth(
                            context: context,
                            fraction: 0.7,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                assignWidth(context: context, fraction: 0.04),
                            vertical:
                                assignHeight(context: context, fraction: 0.04),
                          ),
                          child: _buildAnimation(),
                        ),
                        SizedBox(
                          width: assignWidth(
                            context: context,
                            fraction: 0.025,
                          ),
                        ),
                        TrailingInfo(
                          width: assignWidth(
                            context: context,
                            fraction: 0.075,
                          ),
                          trailingWidget: CustomScroller(
                            onUpTap: () {
                              _scroll(
                                  _scrollController.position.minScrollExtent);
                            },
                            onDownTap: () {
                              _scroll(
                                  _scrollController.position.maxScrollExtent);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCertification(
    BuildContext context,
    Widget? child,
  ) {
    return ListView(
      controller: _scrollController,
      children: [
        Wrap(
          direction: Axis.horizontal,
          spacing: assignWidth(context: context, fraction: 0.0099),
          runSpacing: assignHeight(context: context, fraction: 0.02),
          children: _certificateList(Data.certificationData),
        ),
      ],
    );
  }

  Widget _buildAnimation() {
    return AnimatedBuilder(
      animation: _controller,
      builder: _buildCertification,
    );
  }

  List<Widget> _certificateList(List<CertificationData> certificationData) {
    List<Widget> widgets = [];
    double duration = _controller.duration!.inMilliseconds.roundToDouble();
    double durationForEachPortfolio =
        _controller.duration!.inMilliseconds.roundToDouble() /
            certificationData.length;

    for (var i = 0; i < certificationData.length; i++) {
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
          child: PortfolioCard(
            imageUrl: certificationData[i].image,
            onTap: () => _viewCertificate(certificationData[i].url),
            title: certificationData[i].title,
            subtitle: certificationData[i].awardedBy,
            actionTitle: StringConst.VIEW,
            height: isDisplaySmallDesktopOrIpadPro(context)
                ? assignHeight(context: context, fraction: 0.3)
                : assignHeight(context: context, fraction: 0.45),
            width: isDisplaySmallDesktopOrIpadPro(context)
                ? assignWidth(
                    context: context,
                    fraction: 0.3,
                  )
                : assignWidth(
                    context: context,
                    fraction: certificationData[i].imageSize,
                  ),
          ),
        ),
      );
    }
    return widgets;
  }

  _scroll(double offset) {
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }

  void _viewCertificate(String url) {
    Functions.launchUrl(url);
  }
}
