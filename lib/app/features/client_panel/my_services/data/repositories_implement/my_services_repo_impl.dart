import 'package:bike_service_app/app/core/firebase_api_instances/firebase_api_instances.dart';
import 'package:bike_service_app/app/features/client_panel/my_services/domain/repositories/my_services_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyServicesRepoImpl implements MyServicesRepository {
  @override
  Stream<QuerySnapshot<Map<String, dynamic>>?> getStream() {
    try {
      return FirebaseApiInstances()
          .firestoreInstance
          .value
          .collection('services')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('myservices')
          .orderBy('Booking ID', descending: true)
          .snapshots();
    } catch (e) {
      debugPrint(
          'Error in MyServicesRepoImpl while calling getStream() method = $e');
    }
    throw UnimplementedError(
        'Unimplemented Error in MyServicesRepoImpl for getStream() method of MyServicesRepository abstract class');
  }
}
