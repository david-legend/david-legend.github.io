import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/pages/widgets/animated_footer.dart';
import 'package:aerium/presentation/widgets/animated_slide_box.dart';
import 'package:aerium/presentation/widgets/content_area.dart';
import 'package:aerium/presentation/widgets/content_builder.dart';
import 'package:aerium/presentation/widgets/custom_spacer.dart';
import 'package:aerium/presentation/widgets/page_wrapper.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class ExperiencePage extends StatefulWidget {
  static const String experiencePageRoute = StringConst.EXPERIENCE_PAGE;
  const ExperiencePage({Key? key}) : super(key: key);

  @override
  _ExperiencePageState createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage>
      with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyText1Style = textTheme.bodyText1?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );
    TextStyle? bodyText2Style =
        textTheme.bodyText1?.copyWith(color: AppColors.grey750);
    TextStyle? titleStyle = textTheme.subtitle1?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
      ),
    );

    return PageWrapper(
      selectedRoute: ExperiencePage.experiencePageRoute,
      selectedPageName: StringConst.EXPERIENCE,
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
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildExperienceSection(
                  data: Data.experienceData,
                  width: contentAreaWidth,
                ),
              ),
            ),
          ),
          AnimatedFooter(),
        ],
      ),
    );
  }

  List<Widget> _buildExperienceSection({
    required List<ExperienceData> data,
    required double width,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultTitleStyle = textTheme.subtitle1?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_18,
        Sizes.TEXT_SIZE_20,
      ),
    );
    TextStyle? positionStyle = textTheme.bodyText1?.copyWith(
      color: AppColors.grey600,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_14,
        Sizes.TEXT_SIZE_18,
      ),
    );
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        ContentBuilder(
          number: "/0${index + 1}",
          width: width,
          section: data[index].duration.toUpperCase(),
          heading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                data[index].company,
                style: defaultTitleStyle,
              ),
              SpaceH16(),
              SelectableText(
                data[index].position,
                style: defaultTitleStyle?.copyWith(
                  fontSize: responsiveSize(
                    context,
                    Sizes.TEXT_SIZE_16,
                    Sizes.TEXT_SIZE_18,
                  ),
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildRoles(data[index].roles),
          ),
        ),
      );
      items.add(
        CustomSpacer(heightFactor: 0.1),
      );
    }

    return items;
  }

  List<Widget> _buildRoles(List<String> roles) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? bodyText1Style = textTheme.bodyText1?.copyWith(
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        17,
      ),
      color: AppColors.grey750,
      fontWeight: FontWeight.w300,
      height: 1.5,
      // letterSpacing: 2,
    );

    List<Widget> items = [];
    for (int index = 0; index < roles.length; index++) {
      items.add(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.play_arrow_outlined,
              color: AppColors.black,
              size: 12,
            ),
            SpaceW8(),
            Flexible(
              child: Text(
                roles[index],
                style: bodyText1Style,
              ),
            ),
          ],
        ),
      );

      items.add(SpaceH20());
    }

    return items;
  }
}
