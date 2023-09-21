import 'package:flutter/material.dart';
import 'package:login_test/core/style.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    required this.ontap,
    required this.text,
    this.isGetOTP = false,
  });
  final Function()? ontap;
  final String text;
  final bool isGetOTP;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: height * 0.07,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black),
          color: const Color.fromARGB(255, 228, 69, 51),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: width * 0.02),
              if (isGetOTP)
                Image.asset(
                  'assets/images/otp.png',
                  height: 45,
                  width: 45,
                )
            ],
          ),
        ),
      ),
    );
  }
}
