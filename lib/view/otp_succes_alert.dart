import 'package:flutter/material.dart';
import 'package:login_test/view/login.dart';
import 'package:vector_math/vector_math.dart' as math;

Widget _dialog(BuildContext context) {
  return AlertDialog(
    title: const Text("Alert"),
    content: const Text("Your details has been submitted"),
    actions: <Widget>[
      TextButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
                (route) => false);
          },
          child: const Text("Okay"))
    ],
  );
}

void rotateDialog({required BuildContext context}) {
  showGeneralDialog(
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      return Transform.rotate(
        angle: math.radians(a1.value * 360),
        child: _dialog(ctx),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
