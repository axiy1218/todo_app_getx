import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignInControllerRepository {
  void checkEmail(String? value);
  void validPassword(String? value);
  void changeVisibility();
  void signIn();
  void onSignUpButtonPressed();
}

class SignInController extends GetxController
    implements SignInControllerRepository {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool? isObscure = true;
  @override
  void checkEmail(String? value) {
    bool? isEmail = GetUtils.isEmail(value!);

    if (isEmail) {
      ///to do
      ///
    }
    Get.snackbar('email', "email xato kiritilgan");
    update();
  }

  @override
  void validPassword(String? value) {
    if (value!.length < 8) {
      Get.snackbar('password', 'Kiritilgan password 8 ta belgidan kam');
      update();
    }
  }

  @override
  void changeVisibility() {
    isObscure = !isObscure!;
    update();
  }

  @override
  void signIn() {}

  @override
  void onSignUpButtonPressed() {
    Get.back();
  }
}
