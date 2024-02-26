import 'package:bike_service_app/app/core/firebase_api_instances/firebase_api_instances.dart';
import 'package:bike_service_app/app/features/authentication/domain/entities/signup_user_entity.dart';
import 'package:bike_service_app/app/features/authentication/domain/repositories/signup_repositories/signup_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/theme/colors/colors.dart';

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
      Get.snackbar('User Registered Successfully', 'User credentials saved.',
          colorText: Colors.white,
          backgroundColor: AppColors.snackBarColorSuccess);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('weak-password', 'The password provided is too weak.',
            colorText: Colors.white,
            backgroundColor: AppColors.snackBarColorWarning);
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('email-already-in-use',
            'The account already exists for that email.',
            colorText: Colors.white,
            backgroundColor: AppColors.snackBarColorWarning);
        debugPrint('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        Get.snackbar('invalid-email', 'The email address is not valid.',
            colorText: Colors.white,
            backgroundColor: AppColors.snackBarColorWarning);
        debugPrint('The email address is not valid.');
      } else if (e.code == 'operation-not-allowed') {
        Get.snackbar('operation-not-allowed',
            'Email/Password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.',
            colorText: Colors.white,
            backgroundColor: AppColors.snackBarColorWarning);
        debugPrint(
            'Email/Password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.');
      }
    } catch (e) {
      Get.snackbar('Other Sign Up error', '$e',
          colorText: Colors.white,
          backgroundColor: AppColors.snackBarColorWarning);
      debugPrint('Other Sign Up error = $e');
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
