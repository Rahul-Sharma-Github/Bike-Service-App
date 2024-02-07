import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/firebase_api_instances/firebase_api_instances.dart';

class DrawerControllerCommon extends GetxController {
  // variable to store User Name
  var userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getUserName();
  }

  // Method to get User Name from Database
  void getUserName() {
    FirebaseApiInstances()
        .firestoreInstance
        .value
        .collection('users')
        .doc(FirebaseApiInstances().authInstance.value.currentUser?.email)
        .get()
        .then(
      (value) {
        final document = value.data();
        userName.value = document?['name'];
      },
      onError: (e) => debugPrint("Error getting document: $e"),
    );
  }
}
