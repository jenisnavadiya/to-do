import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/controller/signin_controller.dart';
import 'package:to_do/utilities/route_utils.dart';

// ignore: must_be_immutable
class SigninScreen extends StatelessWidget {
  SigninScreen({Key? key}) : super(key: key);
  SigninController _signinController =
      Get.find(tag: SigninController().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SigninController>(
        init: _signinController,
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _signinController.nameTextController,
                  decoration: InputDecoration(hintText: "name"),
                ),
                TextFormField(
                  controller: _signinController.emailTextController,
                  decoration: InputDecoration(hintText: "email"),
                ),
                TextFormField(
                  controller: _signinController.passwordTextController,
                  decoration: InputDecoration(hintText: "Password"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _signinController.signin();
                  },
                  child: Text("Sigin"),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteUtilities.loginScreen);
                  },
                  child: Text('already have an account ?'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
