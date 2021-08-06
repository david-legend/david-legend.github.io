import 'package:aerium/core/layout/adaptive.dart';
import 'package:aerium/presentation/widgets/animated_bubble_button.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class ProjectItemData {
  ProjectItemData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.subtitle,
    required this.portfolioDescription,
    this.technologyUsed,
    this.isPublic = false,
    this.isOnPlayStore = false,
    this.isLive = false,
    this.gitHubUrl = "",
    this.hasBeenReleased = true,
    this.playStoreUrl = "",
    this.webUrl = "",
  });

  final String image;
  final String portfolioDescription;
  final double imageSize;
  final String title;
  final String subtitle;
  final bool isPublic;
  final bool hasBeenReleased;
  final String gitHubUrl;
  final bool isOnPlayStore;
  final String playStoreUrl;
  final bool isLive;
  final String webUrl;
  final String? technologyUsed;
}

const double startWidthOfButton = 54;
const double heightOfButton = startWidthOfButton;

class ProjectItemLg extends StatefulWidget {
  const ProjectItemLg({
    Key? key,
    required this.projectNumber,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.containerColor,
    this.projectItemheight,
    this.subheight,
    this.coloredContainerHeight,
    this.coloredContainerWidth,
    this.buttonTitle = StringConst.VIEW,
    this.backgroundOnHoverColor = AppColors.primaryColor,
    this.backgroundColor = AppColors.accentColor2,
    this.projectNumberStyle,
    this.subtitleStyle,
    this.titleStyle,
    this.duration = const Duration(milliseconds: 200),
    this.padding,
  }) : super(key: key);

  final String projectNumber;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String buttonTitle;
  final TextStyle? projectNumberStyle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color containerColor;
  final Color backgroundColor;
  final Color backgroundOnHoverColor;
  final Duration duration;
  final double? projectItemheight;
  final double? subheight;
  final double? coloredContainerWidth;
  final double? coloredContainerHeight;
  final EdgeInsetsGeometry? padding;

  @override
  _ProjectItemLgState createState() => _ProjectItemLgState();
}

class _ProjectItemLgState extends State<ProjectItemLg>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(
      begin: -500,
      end: 0,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        _isHovering = hovering;
        _controller.forward();
      });
    } else {
      setState(() {
        _isHovering = hovering;
        _controller.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double projectItemWidth = widthOfScreen(context);
    double projectItemHeight =
        widget.projectItemheight ?? assignHeight(context, 0.4);
    double subheight = widget.subheight ?? (3 / 4 * projectItemHeight);
    double containerHeight = widget.coloredContainerHeight ??
        (subheight * 0.8); //defaults to 80% of height of screen
    double containerWidth = widget.coloredContainerWidth ??
        assignWidth(context, 0.25); //defaults to 25% of width of screen
    double positionOfButton = (subheight / 2) - startWidthOfButton;
    double positionOfColoredContainer = positionOfButton + (heightOfButton / 2);
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? buttonStyle = textTheme.bodyText1?.copyWith(
      color: AppColors.black,
      fontSize: Sizes.TEXT_SIZE_16,
      fontWeight: FontWeight.w500,
    );
    TextStyle? defaultNumberStyle = widget.projectNumberStyle ??
        textTheme.subtitle1?.copyWith(
          fontSize: _isHovering ? Sizes.TEXT_SIZE_20 : Sizes.TEXT_SIZE_16,
          color: AppColors.grey550,
          fontWeight: _isHovering ? FontWeight.w400 : FontWeight.w300,
        );
    TextStyle? defaultTitleStyle = widget.titleStyle ??
        textTheme.subtitle1?.copyWith(
          color: AppColors.black,
          fontSize: 40,
        );
    TextStyle? defaultSubtitleStyle = widget.subtitleStyle ??
        textTheme.bodyText1?.copyWith(
          color: AppColors.grey700,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 2.5,
          // fontWeight: FontWeight.w500,
        );
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Container(
        height: projectItemHeight,
        width: projectItemWidth,
        child: Stack(
          children: [
            Container(
              width: projectItemWidth,
              height: subheight,
              padding: widget.padding ?? EdgeInsets.only(top: subheight / 4),
              color: _isHovering
                  ? widget.backgroundOnHoverColor
                  : widget.backgroundColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    opacity: _isHovering ? 1.0 : 0.5,
                    duration: widget.duration,
                    child: ProjectData(
                      duration: widget.duration,
                      projectNumber: widget.projectNumber,
                      indicatorWidth: _isHovering
                          ? assignWidth(context, 0.18)
                          : assignWidth(context, 0.12),
                      leadingMargin: EdgeInsets.only(
                        top: (defaultTitleStyle!.fontSize! -
                                defaultNumberStyle!.fontSize!) /
                            2.5,
                        right: Sizes.MARGIN_8,
                      ),
                      indicatorMargin: EdgeInsets.only(
                        top: defaultNumberStyle.fontSize! / 2.5,
                        right: Sizes.MARGIN_8,
                      ),
                      title: widget.title,
                      subtitle: widget.subtitle,
                      subtitleStyle: defaultSubtitleStyle,
                      titleStyle: defaultTitleStyle,
                      projectNumberStyle: defaultNumberStyle,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: positionOfColoredContainer,
              right: assignWidth(context, 0.1),
              child: AnimatedContainer(
                width: _isHovering ? containerWidth : 0,
                color: widget.containerColor,
                duration: widget.duration,
                height: containerHeight,
              ),
            ),
            Positioned(
              right: 0,
              child: Transform(
                origin: Offset(_animation.value, 100),
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0095)
                  // ..rotateX(0.005)
                  ..rotateY(0.075),
                child: Image.asset(
                  widget.imageUrl,
                  width: 500,
                  height: containerHeight,
                ),
              ),
            ),
            Positioned(
              top: positionOfButton, //places button
              right: assignWidth(context, 0.2),
              child: AnimatedBubbleButton(
                startWidth: startWidthOfButton,
                hovering: _isHovering,
                controller: _controller,
                duration: widget.duration,
                height: startWidthOfButton,
                targetWidth: 200,
                startBorderRadius:
                    const BorderRadius.all(Radius.circular(100.0)),
                title: StringConst.VIEW_PROJECT.toUpperCase(),
                color: AppColors.grey100,
                titleStyle: buttonStyle,
                imageColor: AppColors.black,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectData extends StatelessWidget {
  const ProjectData({
    Key? key,
    required this.projectNumber,
    required this.title,
    required this.subtitle,
    required this.duration,
    this.curve = Curves.linear,
    this.projectNumberStyle,
    this.subtitleStyle,
    this.titleStyle,
    this.indicatorColor = AppColors.grey550,
    this.indicatorHeight = Sizes.HEIGHT_1,
    this.indicatorWidth = Sizes.WIDTH_150,
    this.indicatorMargin,
    this.leadingMargin,
  }) : super(key: key);

  final String projectNumber;
  final String title;
  final String subtitle;
  final Color indicatorColor;
  final TextStyle? projectNumberStyle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double indicatorWidth;
  final double indicatorHeight;
  final EdgeInsetsGeometry? indicatorMargin;
  final EdgeInsetsGeometry? leadingMargin;
  final Duration duration;
  final Curve curve;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: leadingMargin,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                width: indicatorWidth,
                height: indicatorHeight,
                margin: indicatorMargin,
                color: indicatorColor,
                duration: duration,
                curve: curve,
              ),
              SpaceW4(),
              Text(
                projectNumber,
                style: projectNumberStyle,
              ),
            ],
          ),
        ),
        SpaceW30(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            SpaceH16(),
            Text(subtitle, style: subtitleStyle),
          ],
        ),
      ],
    ));
  }
}
