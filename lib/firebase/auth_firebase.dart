import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/firebase/firebase.dart';
import 'package:to_do/models/note_model.dart';
import 'package:to_do/models/user_model.dart';

class AuthFirebase {
  static Future<void> signIn(String name, String email, String password) async {
    UserCredential userDetails = await FirebaseManager.authInstance
        .createUserWithEmailAndPassword(email: email, password: password);
    String userId = userDetails.user?.uid ?? "";
    await FirebaseManager.firestoreInstance
        .collection(FirebaseCollections.userCollection)
        .doc(userId)
        .set(UserModel(
          email: email,
          fullname: name,
          password: password,
        ).toMap());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchNotes(
      String status) async* {
    String userId = FirebaseManager.authInstance.currentUser?.uid ?? "";
    yield* FirebaseManager.firestoreInstance
        .collection(FirebaseCollections.userCollection)
        .doc(userId)
        .collection("Notes")
        .where("noteState", isEqualTo: status)
        .snapshots();
  }

  static Future<void> createNote(String title, String description) async {
    String userId = FirebaseManager.authInstance.currentUser?.uid ?? "";
    await FirebaseManager.firestoreInstance
        .collection(FirebaseCollections.userCollection)
        .doc(userId)
        .collection("Notes")
        .doc()
        .set(NoteModel(
                title: title, description: description, noteState: "PENDING")
            .toMap())
        .whenComplete(() => print('Task Added Successfully'))
        .catchError((e) => print(e));
  }

  static updateStatus(String docId, String status) async {
    String userId = FirebaseManager.authInstance.currentUser?.uid ?? "";
    await FirebaseManager.firestoreInstance
        .collection(FirebaseCollections.userCollection)
        .doc(userId)
        .collection("Notes")
        .doc(docId)
        .update({"noteState": status});
  }

  static Future<void> removeNotes(String docId) async {
    await FirebaseManager.firestoreInstance
        .collection(FirebaseCollections.userCollection)
        .doc(FirebaseManager.authInstance.currentUser!.uid.toString())
        .collection('Notes')
        .doc(docId)
        .delete();
  }
}
