import 'package:bike_service_app/app/core/firebase_api_instances/firebase_api_instances.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntryPointController extends GetxController {
  var isAdmin = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAdminLoginStatus();
  }

  void getAdminLoginStatus() {
    FirebaseApiInstances()
        .firestoreInstance
        .value
        .collection('users')
        .doc(FirebaseApiInstances().authInstance.value.currentUser?.email)
        .get()
        .then(
      (value) {
        final document = value.data();
        if (document?['admin'] == 'false') {
          isAdmin.value = false;
        } else {
          isAdmin.value = true;
        }
      },
      onError: (e) => debugPrint(
          "Error in getAdminLoginStatus() Method, while getting User Admin Status from Database = $e"),
    );
  }
}
