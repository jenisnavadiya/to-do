import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/controller/task_controller.dart';
import 'package:to_do/firebase/auth_firebase.dart';

class EditTaskScreenForProcessing extends StatefulWidget {
  int index;
  EditTaskScreenForProcessing({Key? key, required this.index})
      : super(key: key);

  @override
  _EditTaskScreenForProcessingState createState() =>
      _EditTaskScreenForProcessingState();
}

class _EditTaskScreenForProcessingState
    extends State<EditTaskScreenForProcessing> {
  TaskController _taskController = Get.find(tag: TaskController().toString());

  @override
  void initState() {
    _taskController.updateTitleController.text =
        _taskController.processingTaskList[widget.index].title!;

    _taskController.updateDescriptionController.text =
        _taskController.processingTaskList[widget.index].description!;
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
            SizedBox(
              height: 15,
            ),
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
                      _taskController.processingTaskList[widget.index].id!,
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
