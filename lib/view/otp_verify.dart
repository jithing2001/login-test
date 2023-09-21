import 'package:flutter/material.dart';
import 'package:login_test/core/style.dart';
import 'package:login_test/view/bottom_text.dart';
import 'package:login_test/view/common_widgets.dart';
import 'package:login_test/view/otp_succes_alert.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../controller/login_cnrtl.dart';

class OTPVerifyScreen extends StatelessWidget {
  OTPVerifyScreen({super.key});
  final List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    final loginValue = Provider.of<LoginController>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'OTP Verify',
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
              SizedBox(height: height * 0.05),
              SizedBox(
                height: height * 0.3,
                child: OverflowBox(
                  maxHeight: height,
                  maxWidth: width,
                  child: Lottie.asset(
                    'assets/lotties/login.json',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              const Text(
                'OTP send to',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                '+91${loginValue.phoneNumController.text}',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                height: height * 0.07,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: width * 0.2,
                      child: TextField(
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        decoration: InputDecoration(
                          counterText: '',
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 1)),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: (text) {
                          if (text.length == 1 && index < 3) {
                            FocusScope.of(context)
                                .requestFocus(focusNodes[index + 1]);
                          }
                        },
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: width * 0.035);
                  },
                ),
              ),
              SizedBox(height: height * 0.04),
              CustomButton1(
                ontap: () {
                  rotateDialog(context: context);
                  loginValue.clearLoginData();
                },
                text: 'Verify OTP',
              ),
              SizedBox(height: height * 0.04),
              BottomText()
            ],
          ),
        ),
      ),
    );
  }
}
