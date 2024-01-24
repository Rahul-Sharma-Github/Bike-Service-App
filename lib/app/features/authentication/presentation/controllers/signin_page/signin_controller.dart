import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/signin_user_entity.dart';
import '../../../domain/use_cases/signin_usecase/signin_usecase.dart';

class SignInController extends GetxController {
  final SignInUserUseCase signInUserUseCase;

  SignInController(this.signInUserUseCase);

  // TextFormField Controllers

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  // Form Global Key
  final formKey = GlobalKey<FormState>().obs;

  /// saving Form values like -  User Email, Password

  // .obs Variables to store Form values

  final emailID = ''.obs;
  final password = ''.obs;

  // Method to store values
  void saveFormValues(String email, String pass) {
    emailID.value = email;
    password.value = pass;

    // Debugging
    if (emailID.value.isEmpty || password.value.isEmpty) {
      debugPrint('Values are Empty');
    } else {
      debugPrint('Values are saved');
      // Calling createUser Method to Create and Store New User Account Information in Firebase
      signInUser(emailID.value, password.value);
    }
  }

  // Passing saved values to CreateUserUserCase class after initializing the Entity Class
  Future<void> signInUser(String email, String password) async {
    try {
      await signInUserUseCase(
        SignInUserEntity(email: email, password: password),
      );
    } catch (e) {
      debugPrint('Sign In error in SignInController = $e');
    }
  }
}
