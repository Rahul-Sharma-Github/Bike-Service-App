import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseApiInstances extends GetxController {
  // FirebaseAuth Instance for Authentication Operations
  var authInstance = FirebaseAuth.instance.obs;

  // FirebaseFirestore Instance for Firestore Database Operations
  var firestoreInstance = FirebaseFirestore.instance.obs;
}
