import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do/firebase/auth_firebase.dart';
import 'package:to_do/utilities/route_utils.dart';

class SigninController extends GetxController {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  signin() async {
    String name = nameTextController.text;
    String email = emailTextController.text;
    String password = passwordTextController.text;
    await AuthFirebase.signIn(name, email, password);
    Get.toNamed(RouteUtilities.loginScreen);
  }
}
