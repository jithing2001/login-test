import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  TextEditingController phoneNumController = TextEditingController();

  void clearLoginData() => phoneNumController.text = '';
}
