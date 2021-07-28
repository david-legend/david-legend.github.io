import 'package:flutter/material.dart';
import 'package:aerium/values/values.dart';

class ProjectCover extends StatelessWidget {
  ProjectCover({
    this.width,
    this.height,
    this.offset,
    this.projectCoverUrl,
    this.projectCoverBackgroundColor = AppColors.deepBlue900,
    this.alignment = Alignment.topRight,
    this.origin = const Offset(0, 0),
    this.backgroundScale = 1,
    this.projectCoverScale = 1,
  });

  final double? width;
  final double? height;
  final double? offset;
  final String? projectCoverUrl;
  final Color projectCoverBackgroundColor;
  final double backgroundScale;
  final double projectCoverScale;
  final Offset origin;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: offset,
            right: offset,
            child: Transform.scale(
              scale: backgroundScale,
              origin: origin,
              alignment: alignment,
              child: Container(
                width: width! - offset!,
                height: height! - offset!,
                color: projectCoverBackgroundColor,
              ),
            ),
          ),
          Positioned(
            left: offset,
            bottom: offset,
            child: Transform.scale(
              scale: projectCoverScale,
              origin: origin,
              alignment: alignment,
              child: Image.asset(
                projectCoverUrl!,
                width: width! - offset!,
                height: height! - offset!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
