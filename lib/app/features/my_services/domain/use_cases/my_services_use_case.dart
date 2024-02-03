import 'package:bike_service_app/app/features/my_services/domain/repositories/my_services_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyServicesUseCase {
  final MyServicesRepository myServicesRepository;

  MyServicesUseCase(this.myServicesRepository);

  Stream<QuerySnapshot<Map<String, dynamic>>?> callForStream() {
    try {
      return myServicesRepository.getStream();
    } catch (e) {
      debugPrint(
          'Error in MyServicesUseCase class while calling myServicesRepository.getStream()');
    }
    throw UnimplementedError(
        'Unimplemented Error in MyServicesUseCase class while calling getStream() method of MyServicesRepository abstract class');
  }
}
