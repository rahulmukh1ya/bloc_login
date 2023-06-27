import 'package:flutter/material.dart';
// import 'spacers.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        // WidthSpacer();
        Text("Loading...")
      ],
    );
  }
}