import 'dart:convert';

import 'package:bike_service_app/app/features/schedule_summary/domain/entities/service_entity.dart';
import 'package:bike_service_app/app/features/schedule_summary/domain/repositories/schedule_summary_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/firebase_api_instances/firebase_api_instances.dart';

class ScheduleSummaryRepoImpl implements ScheduleSummaryRepository {
  // Firebase Instances from FirebaseApiInstances class
  final FirebaseApiInstances firebaseApiInstances =
      Get.put(FirebaseApiInstances());
  @override
  Future<void> createService(ServiceEntity service) async {
    // Taking & Converting Object/Instance of ServiceEntity class to Json String
    final serviceEntity = serviceEntityToMap(service);
    // after getting Json String, We are converting it to Json Map
    // so that we can pass it to Firebase Firestore Database collection
    final data = json.decode(serviceEntity);
    //
    // Storing latest created Service\'s Map data to the Location = ( services -> doc(uid) -> myservices -> doc(auto-generated ID) {data} )
    try {
      //
      await firebaseApiInstances.firestoreInstance.value
          .collection('services')
          .doc(firebaseApiInstances.authInstance.value.currentUser!.uid)
          .collection('myservices')
          .add(data);
    } catch (e) {
      // Get.snackbar('Other createService error', '$e', colorText: Colors.white);
      debugPrint(
          'Error while Storing latest created Service\'s Map data to Firebase Firestore in ScheduleSummaryRepoImpl class  = $e');
    }
  }
}
