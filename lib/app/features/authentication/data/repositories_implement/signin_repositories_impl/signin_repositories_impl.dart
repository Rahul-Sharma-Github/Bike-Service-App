import 'package:bike_service_app/app/core/constants/theme/colors/colors.dart';
import 'package:bike_service_app/app/global/widget_components/snackbar/snackbar.dart';
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
      Get.snackbar(
        '',
        '',
        titleText: const Text('Signed In !'),
        messageText: Container(),
        backgroundColor: AppColors.snackBarColorSuccess,
      );
      // snackbarWidget(
      //     'User Signed In Successfully', '', AppColors.snackBarColorSuccess);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        snackbarWidget('Invalid', 'Invalid Email & Password. Check Again !',
            AppColors.snackBarColorWarning);

        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        snackbarWidget(
            'wrong-password',
            'Wrong password provided for that user.',
            AppColors.snackBarColorWarning);

        debugPrint('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        snackbarWidget('invalid-email', 'The email address is not valid.',
            AppColors.snackBarColorWarning);

        debugPrint('The email address is not valid.');
      } else if (e.code == 'user-disabled') {
        snackbarWidget(
            'user-disabled',
            'The user corresponding to the given email has been disabled.',
            AppColors.snackBarColorWarning);

        debugPrint(
            'The user corresponding to the given email has been disabled.');
      } else {
        snackbarWidget(
            'Other Sign In Error', '$e', AppColors.snackBarColorWarning);

        debugPrint('Other Sign In Error = $e');
      }
    } catch (e) {
      snackbarWidget(
          'Other Sign In Error', '$e', AppColors.snackBarColorWarning);

      debugPrint('Other Sign In Error = $e');
    }
  }
}
