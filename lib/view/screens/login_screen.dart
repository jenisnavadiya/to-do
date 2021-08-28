import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/controller/login_controller.dart';
import 'package:to_do/utilities/route_utils.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  LoginController _loginController =
      Get.find(tag: LoginController().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: _loginController,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _loginController.emailTextController,
                  decoration: InputDecoration(hintText: "Email"),
                ),
                TextFormField(
                  controller: _loginController.passwordTextController,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RouteUtilities.homeScreen);
                  },
                  child: Text("Login"),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteUtilities.signinScreen);
                  },
                  child: Text('Dont have account ?'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
