import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/controller/task_controller.dart';
import 'package:to_do/firebase/auth_firebase.dart';
import 'package:to_do/utilities/route_utils.dart';
import 'package:to_do/view/screens/edit_task_for_processing.dart';
import 'package:to_do/view/screens/edit_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  TaskController _taskController = Get.find(tag: TaskController().toString());

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _taskController.readPendingNotes();
    _taskController.readPrcessingNotes();
    _taskController.readCompleteNotes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        bottom: TabBar(
          tabs: [
            Tab(
              text: 'Pending',
            ),
            Tab(
              text: 'Processing',
            ),
            Tab(
              text: 'Complete',
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PendingScreen(),
          ProcessingScreen(),
          CompleteScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RouteUtilities.addTaskScreen);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// ignore: must_be_immutable
class PendingScreen extends StatelessWidget {
  PendingScreen({Key? key}) : super(key: key);

  TaskController _taskController = Get.find(tag: TaskController().toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TaskController>(
        init: _taskController,
        builder: (_) {
          return ListView.builder(
            itemCount: _taskController.pendingTaskList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => EditTaskScreen(index: index));
                },
                child: ListTile(
                  title: Text(_taskController.pendingTaskList[index].title!),
                  subtitle:
                      Text(_taskController.pendingTaskList[index].description!),
                  trailing: IconButton(
                      onPressed: () async {
                        await AuthFirebase.updateStatus(
                            _taskController.pendingTaskList[index].id!,
                            'PROCESSING');
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProcessingScreen extends StatelessWidget {
  ProcessingScreen({Key? key}) : super(key: key);

  TaskController _taskController = Get.find(tag: TaskController().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TaskController>(
        init: _taskController,
        initState: (_) {},
        builder: (_) {
          return ListView.builder(
            itemCount: _taskController.processingTaskList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => EditTaskScreenForProcessing(index: index));
                },
                child: ListTile(
                  title: Text(_taskController.processingTaskList[index].title!),
                  subtitle: Text(
                      _taskController.processingTaskList[index].description!),
                  trailing: IconButton(
                      onPressed: () async {
                        await AuthFirebase.updateStatus(
                            _taskController.processingTaskList[index].id!,
                            'COMPLETE');
                      },
                      icon: Icon(Icons.arrow_forward_ios)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CompleteScreen extends StatefulWidget {
  CompleteScreen({Key? key}) : super(key: key);

  @override
  _CompleteScreenState createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  TaskController _taskController = Get.find(tag: TaskController().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TaskController>(
        init: _taskController,
        builder: (_) {
          return ListView.builder(
            itemCount: _taskController.completeTaskList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_taskController.completeTaskList[index].title!),
                subtitle:
                    Text(_taskController.completeTaskList[index].description!),
                trailing: IconButton(
                  onPressed: () async {
                    await AuthFirebase.removeNotes(
                        _taskController.completeTaskList[index].id!);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
