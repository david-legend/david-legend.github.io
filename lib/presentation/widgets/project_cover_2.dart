import 'package:flutter/material.dart';

class ProjectCover2 extends StatelessWidget {
  ProjectCover2(
      {this.width,
      this.height,
      this.offset,
      this.projectCoverUrl,
      this.projectCoverBackgroundColor,
      this.backgroundScale = 1,
      this.projectCoverScale = 1,
      this.alignment = Alignment.topLeft,
      this.origin = const Offset(0, 0)});

  final double? width;
  final double? height;
  final double? offset;
  final double backgroundScale;
  final double projectCoverScale;
  final Offset origin;
  final AlignmentGeometry alignment;
  final String? projectCoverUrl;
  final Color? projectCoverBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
            top: offset,
            left: offset,
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
            right: offset,
            bottom: offset,
            child: Transform.scale(
              scale: projectCoverScale,
              origin: Offset(0, 0),
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
