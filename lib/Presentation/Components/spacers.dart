import 'package:flutter/material.dart';

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({super.key, required this.myHeight});

  final double myHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: myHeight,
    );
  }
}

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({super.key, required this.myWidth});

  final double myWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: myWidth,
    );
  }
}
