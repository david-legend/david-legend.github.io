import 'package:aerium/values/values.dart';
import 'package:flutter/material.dart';

class AnimatedSlideBox extends AnimatedWidget {
  const AnimatedSlideBox({
    Key? key,
    required this.controller,
    required this.height,
    required this.child,
    required this.width,
    visibleBoxAnimation,
    invisibleBoxAnimation,
    slideAnimation,
    this.duration = const Duration(milliseconds: 3000),
    this.boxColor = AppColors.black,
    this.coverColor = AppColors.primaryColor,
    this.curve = Curves.fastOutSlowIn,
  }) : super(key: key, listenable: visibleBoxAnimation);

  // final double width;
  final AnimationController controller;
  final double height;
  final double width;
  final Color boxColor;
  final Color coverColor;
  final Duration duration;
  final Curve curve;
  final Widget child;

  Animation<double> get visibleBoxAnimation =>
      Tween<double>(begin: 0, end: width).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0, 0.35, curve: curve),
        ),
      );
  Animation<double> get invisibleBoxAnimation =>
      Tween<double>(begin: 0, end: width).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.35, 0.70, curve: curve),
        ),
      );
  Animation<Offset> get slideAnimation => Tween<Offset>(
        begin: Offset(0, 2),
        end: Offset(0, 0),
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(0.60, 1.0, curve: curve),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 2,
            child: Container(
              width: visibleBoxAnimation.value,
              height: height - 4,
              color: boxColor,
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: invisibleBoxAnimation.value,
              height: height + 4,
              color: AppColors.primaryColor,
            ),
          ),
          SlideTransition(
            position: slideAnimation,
            child: child,
          ),
        ],
      ),
    );
  }
}

// class _AnimatedSlideBoxState extends State<AnimatedSlideBox> {
//   late Animation<double>? visibleBoxAnimation;
//   late Animation<double>? invisibleBoxAnimation;
//   late Animation<Offset>? slideAnimation;

//   @override
//   void initState() {
//     super.initState();
//     visibleBoxAnimation = widget.visibleBoxAnimation ??
//         Tween<double>(begin: 0, end: widget.width).animate(
//           CurvedAnimation(
//             parent: widget.controller,
//             curve: Interval(0, 0.35, curve: widget.curve),
//           ),
//         );
//     invisibleBoxAnimation = widget.invisibleBoxAnimation ??
        // Tween<double>(begin: 0, end: widget.width).animate(
        //   CurvedAnimation(
        //     parent: widget.controller,
        //     curve: Interval(0.35, 0.70, curve: widget.curve),
        //   ),
        // );
//     slideAnimation = widget.slideAnimation ??
        // Tween<Offset>(
        //   begin: Offset(0, 2),
        //   end: Offset(0, 0),
        // ).animate(
        //   CurvedAnimation(
        //     parent: widget.controller,
        //     curve: Interval(0.60, 1.0, curve: widget.curve),
        //   ),
        // );
//   }

//   Widget _buildAnimation(BuildContext context, Widget? child) {
//     TextTheme textTheme = Theme.of(context).textTheme;
//     return Container(
//       child: Stack(
//         children: [
//           Positioned(
//             top: 2,
//             child: Container(
//               width: visibleBoxAnimation!.value,
//               height: widget.height - 4,
//               color: widget.boxColor,
//             ),
//           ),
//           Positioned(
//             top: 0,
//             child: Container(
//               width: invisibleBoxAnimation!.value,
//               height: widget.height + 4,
//               color: AppColors.primaryColor,
//             ),
//           ),
//           SlideTransition(
//             position: slideAnimation!,
//             child: Text(
//               "GET IN TOUCH",
//               style: textTheme.headline2?.copyWith(
//                 color: AppColors.black,
//                 fontSize: 60,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       builder: _buildAnimation,
//       animation: widget.controller,
//     );
//   }
// }
