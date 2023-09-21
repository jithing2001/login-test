import 'package:flutter/material.dart';
import 'package:login_test/core/style.dart';
import 'package:lottie/lottie.dart';

class LottieContainer extends StatelessWidget {
  final lottie;
  const LottieContainer({super.key, required this.lottie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.3,
      child: Lottie.asset(
        '$lottie',
        fit: BoxFit.fill,
      ),
    );
  }
}
