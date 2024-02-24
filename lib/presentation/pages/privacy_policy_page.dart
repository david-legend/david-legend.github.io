import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/widgets/animated_footer.dart';
import 'package:aerium/presentation/pages/widgets/page_header.dart';
import 'package:aerium/presentation/widgets/content_area.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatefulWidget {
  static const String pageRoute = StringConst.PRIVACY_POLICY_PAGE;

  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.75),
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
        assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
      ),
    );
    return PageWrapper(
      selectedRoute: PrivacyPolicyPage.pageRoute,
      selectedPageName: StringConst.PRIVACY_POLICY,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          PageHeader(
            headingText: StringConst.PRIVACY_POLICY,
            headingTextController: _controller,
          ),
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Privacy Policy",
                    style: theme.textTheme.titleLarge,
                  ),
                  SpaceH12(),
                  Text(
                    "Thank you for using any of the following apps: Drop, Flutter Catalog, Login Catalog, FoodyBite, and Roam. We respect your privacy and want to be transparent about how we handle your personal information.",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SpaceH20(),
                  Text(
                    "Information Collection",
                    style: theme.textTheme.titleLarge,
                  ),
                  SpaceH12(),
                  Text(
                    "We want to assure you that we do not collect any personally identifiable information from our users. We do not request, store, or have access to any data that could be used to identify you personally.",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SpaceH20(),
                  Text(
                    "Usage Information",
                    style: theme.textTheme.titleLarge,
                  ),
                  SpaceH12(),
                  Text(
                    "While you use Drop, Flutter Catalog, Login Catalog, FoodyBite, and Roam, we do not track your activities or gather any usage information. Your interactions with the apps remain entirely anonymous.",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SpaceH20(),
                  Text(
                    "Third-Party Services",
                    style: theme.textTheme.titleLarge,
                  ),
                  SpaceH12(),
                  Text(
                    "Our apps do not integrate with any third-party services that collect user data. We prioritize your privacy and aim to provide a secure and enjoyable experience without compromising your personal information.",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SpaceH20(),
                  Text(
                    "Contact",
                    style: theme.textTheme.titleLarge,
                  ),
                  SpaceH12(),
                  Text(
                    '''If you have any questions or concerns regarding our privacy policy, please feel free to contact us at davidcobbina47@gmail.com.\nThank you for trusting us with your privacy.''',
                    style: theme.textTheme.bodyLarge,
                  ),
                  SpaceH20(),
                ],
              ),
            ),
          ),
          SpaceH40(),
          AnimatedFooter(),
        ],
      ),
    );
  }
}
