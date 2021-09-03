import 'package:get/get.dart';
import 'package:to_do/bindings/auth_bindings.dart';
import 'package:to_do/bindings/task_binding.dart';
import 'package:to_do/view/screens/add_task_screen.dart';
import 'package:to_do/view/screens/edit_task_screen.dart';
import 'package:to_do/view/screens/home_screen.dart';
import 'package:to_do/view/screens/login_screen.dart';
import 'package:to_do/view/screens/signin_screen.dart';
import 'package:to_do/view/screens/splash_screen.dart';

class RouteUtilities {
  static const String root = "/";
  static const String splashScreen = "/splashScreen";
  static const String loginScreen = "/loginScreen";
  static const String signinScreen = "/signinScreen";
  static const String homeScreen = "/homeScreen";
  static const String addTaskScreen = "/addTaskScreen";
  static const String editTaskScreen = "/editTaskScreen";

  static List<GetPage> pages = [
    GetPage(
      name: root,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: signinScreen,
      page: () => SigninScreen(),
      binding: AuthBindings(),
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      binding: TaskBindings(),
    ),
    GetPage(
      name: addTaskScreen,
      page: () => AddTaskScreen(),
      binding: TaskBindings(),
    ),
    // GetPage(
    //   name: editTaskScreen,
    //   page: () => EditTaskScreen(),
    //   binding: TaskBindings(),
    // ),
  ];
}
