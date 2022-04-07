import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LottieBuilder.asset(
      "assets/loaderPurple.json",
      width: 100.0,
    ));
  }
}
