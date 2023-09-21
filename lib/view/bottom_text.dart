import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'By signing up you agree to our terms\nand conditions',
      style: TextStyle(color: Colors.grey, fontSize: 15),
      textAlign: TextAlign.center,
    );
  }
}
