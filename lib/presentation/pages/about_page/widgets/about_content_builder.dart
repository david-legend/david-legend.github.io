import 'package:aerium/presentation/widgets/empty.dart';
import 'package:aerium/presentation/widgets/spaces.dart';
import 'package:flutter/material.dart';

class AboutContentBuilder extends StatelessWidget {
  const AboutContentBuilder({
    Key? key,
    required this.number,
    required this.tag,
    required this.title,
    required this.body,
    this.footer,
  }) : super(key: key);

  final String number;
  final String tag;
  final String title;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Text(number),
        Text(tag),
        Column(
          children: [
            Text(title),
            SpaceH20(),
            body,
            footer ?? Empty(),
          ],
        )
      ],
    ));
  }
}
