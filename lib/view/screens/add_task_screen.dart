import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/controller/task_controller.dart';
import 'package:to_do/firebase/auth_firebase.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  TaskController _taskController = Get.find(tag: TaskController().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              controller: _taskController.titleController,
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              controller: _taskController.descriptionController,
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () async {
                  await AuthFirebase.createNote(
                      _taskController.titleController.text,
                      _taskController.descriptionController.text);

                  _taskController.titleController.clear();
                  _taskController.descriptionController.clear();

                  Get.back();
                },
                child: Text('Add Task to Pending'))
          ],
        ),
      ),
    );
  }
}
