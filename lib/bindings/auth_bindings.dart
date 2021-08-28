import 'package:get/get.dart';
import 'package:to_do/controller/login_controller.dart';
import 'package:to_do/controller/signin_controller.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(), tag: LoginController().toString());
    Get.put(SigninController(), tag: SigninController().toString());
  }
}
