import 'package:flutter/material.dart';
import 'package:login_test/controller/login_cnrtl.dart';
import 'package:login_test/core/style.dart';
import 'package:login_test/view/bottom_text.dart';
import 'package:login_test/view/common_widgets.dart';
import 'package:login_test/view/lottie_container.dart';
import 'package:login_test/view/otp_verify.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final loginValue = Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Log in',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(height * 0.02),
          child: Column(
            children: [
              SizedBox(height: height * 0.02),
              const LottieContainer(
                lottie: 'assets/lotties/animation_lmtcjiwl.json',
              ),
              SizedBox(height: height * 0.1),
              TextField(
                controller: loginValue.phoneNumController,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: '',
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(height * 0.02),
                    child: const Text(
                      '+91',
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ),
                  hintText: 'Phone Number',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: height * 0.04),
              CustomButton1(
                ontap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OTPVerifyScreen(),
                  ));
                },
                text: 'Get OTP',
                isGetOTP: true,
              ),
              SizedBox(height: height * 0.04),
              BottomText(),
            ],
          ),
        ),
      ),
    );
  }
}
