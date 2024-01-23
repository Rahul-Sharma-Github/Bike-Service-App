import 'package:bike_service_app/app/core/firebase_api_instances/firebase_api_instances.dart';
import 'package:bike_service_app/app/features/authentication/domain/entities/signup_user_entity.dart';
import 'package:bike_service_app/app/features/authentication/domain/repositories/signup_repositories/signup_repositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpRepositoryImpl implements SignUpRepositories {
  final FirebaseApiInstances firebaseApiInstances =
      Get.put(FirebaseApiInstances());
  @override
  Future<void> createUser(SignUpUserEntity user) async {
    try {
      await firebaseApiInstances.authInstance.value
          .createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } catch (e) {
      debugPrint('Firestore Authentication error in Implementation Class = $e');
    }

    // Storing Created User Details inside Firebase Firestore Database
    try {
      await firebaseApiInstances.firestoreInstance.value
          .collection('users')
          .doc(user.email)
          .set({
        'name': user.name,
        'email': user.email,
        'admin': false,
      });
    } catch (e) {
      debugPrint('Firestore Database error in Implementation Class = $e');
    }
  }
}
