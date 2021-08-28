import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/utilities/route_utils.dart';
import 'package:to_do/utilities/var_utils.dart';

void main() {
  GetStorage.init("MyToDoApp");
  Firebase.initializeApp();
  VariableUtilities.prefs = GetStorage("MyToDoApp");
  return runApp(MyToDoApp());
}

class MyToDoApp extends StatelessWidget {
  const MyToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteUtilities.signinScreen,
      getPages: RouteUtilities.pages,
    );
  }
}
