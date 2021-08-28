import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseManager {
  static FirebaseAuth authInstance = FirebaseAuth.instance;
  static FirebaseFirestore firestoreInstance = FirebaseFirestore.instance;
}

class FirebaseCollections {
  static const String userCollection = "UserCollection";
}
