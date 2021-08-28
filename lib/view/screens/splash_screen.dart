import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/utilities/route_utils.dart';
import 'package:to_do/utilities/var_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  startTimer() async {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      _timer?.cancel();
      bool isLogin = VariableUtilities.prefs?.read("isToDoAppLogin") ?? false;
      if (isLogin) {
        Get.toNamed(RouteUtilities.homeScreen);
      } else {
        Get.toNamed(RouteUtilities.loginScreen);
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('To Do Application...'),
      ),
    );
  }
}
