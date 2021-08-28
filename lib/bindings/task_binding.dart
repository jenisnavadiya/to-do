import 'package:get/get.dart';
import 'package:to_do/controller/task_controller.dart';

class TaskBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskController(), tag: TaskController().toString());
  }
}
