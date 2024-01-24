import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/firebase_api_instances/firebase_api_instances.dart';
import '../../../domain/entities/signin_user_entity.dart';
import '../../../domain/repositories/signin_repositories/signin_repositories.dart';

class SignInRepositoryImpl implements SignInRepositories {
  final FirebaseApiInstances firebaseApiInstances =
      Get.put(FirebaseApiInstances());
  @override
  Future<void> signinUser(SignInUserEntity user) async {
    try {
      await firebaseApiInstances.authInstance.value.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      Get.back();
      Get.snackbar('User Signed In Successfully', '', colorText: Colors.white);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        Get.snackbar('Invalid', 'Invalid Email & Password. Check Again !',
            colorText: Colors.white);
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('wrong-password', 'Wrong password provided for that user.',
            colorText: Colors.white);
        debugPrint('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        Get.snackbar('invalid-email', 'The email address is not valid.',
            colorText: Colors.white);
        debugPrint('The email address is not valid.');
      } else if (e.code == 'user-disabled') {
        Get.snackbar('user-disabled',
            'The user corresponding to the given email has been disabled.',
            colorText: Colors.white);
        debugPrint(
            'The user corresponding to the given email has been disabled.');
      } else {
        Get.snackbar('Other Sign In Error', '$e', colorText: Colors.white);
        debugPrint('Other Sign In Error = $e');
      }
    } catch (e) {
      Get.snackbar('Other Sign In Error', '$e', colorText: Colors.white);
      debugPrint('Other Sign In Error = $e');
    }
  }
}
