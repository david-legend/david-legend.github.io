import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0,
      height: 0,
    );
  }
}