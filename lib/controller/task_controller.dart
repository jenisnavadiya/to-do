import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/firebase/auth_firebase.dart';
import 'package:to_do/models/note_model.dart';

class TaskController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<NoteModel> pendingTaskList = [];
  List<NoteModel> processingTaskList = [];
  List<NoteModel> completeTaskList = [];

  readPendingNotes() {
    AuthFirebase.fetchNotes('PENDING')
        .listen((QuerySnapshot<Map<String, dynamic>> e) {
      pendingTaskList.clear();
      e.docs.forEach((DocumentSnapshot element) {
        print(element);
        print('element.data()');
        pendingTaskList.add(
          NoteModel.fromMap(element.data() as Map<String, dynamic>, element.id),
        );
        update();
      });
    });
  }

  readPrcessingNotes() {
    AuthFirebase.fetchNotes('PROCESSING')
        .listen((QuerySnapshot<Map<String, dynamic>> e) {
      processingTaskList.clear();
      e.docs.forEach((DocumentSnapshot element) {
        print(element);
        print('element.data()');
        processingTaskList.add(NoteModel.fromMap(
            element.data() as Map<String, dynamic>, element.id));
        update();
      });
    });
  }

  readCompleteNotes() {
    AuthFirebase.fetchNotes('COMPLETE')
        .listen((QuerySnapshot<Map<String, dynamic>> e) {
      print("COMPLETED");
      completeTaskList.clear();
      e.docs.forEach((DocumentSnapshot element) {
        print(element.data() as Map);
        completeTaskList.add(NoteModel.fromMap(
            element.data() as Map<String, dynamic>, element.id));
      });
      update();
    });
  }
}
