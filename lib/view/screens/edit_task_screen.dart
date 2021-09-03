import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/controller/task_controller.dart';
import 'package:to_do/firebase/auth_firebase.dart';

class EditTaskScreen extends StatefulWidget {
  int index;
  EditTaskScreen({Key? key, required this.index}) : super(key: key);

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TaskController _taskController = Get.find(tag: TaskController().toString());

  @override
  void initState() {
    _taskController.updateTitleController.text =
        _taskController.pendingTaskList[widget.index].title!;

    _taskController.updateDescriptionController.text =
        _taskController.pendingTaskList[widget.index].description!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              controller: _taskController.updateTitleController,
            ),
            SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              controller: _taskController.updateDescriptionController,
            ),
            TextButton(
                onPressed: () async {
                  await AuthFirebase.updateTasks(
                      _taskController.pendingTaskList[widget.index].id!,
                      _taskController.updateTitleController.text,
                      _taskController.updateDescriptionController.text);

                  Get.back();
                },
                child: Text('Update Task'))
          ],
        ),
      ),
    ));
  }
}
