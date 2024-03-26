import 'package:bike_service_app/app/features/client_panel/authentication/domain/entities/signup_user_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/use_cases/signup_usecases/signup_usecases.dart';

class SignUpController extends GetxController {
  final CreateUserUseCase createUserUseCase;

  SignUpController(this.createUserUseCase);

  // TextFormField Controllers
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  // Form Global Key
  final formKeySignUp = GlobalKey<FormState>().obs;

  /// saving Form values like -  User Name, Email, Password

  // .obs Variables to store Form values
  final userName = ''.obs;
  final emailID = ''.obs;
  final password = ''.obs;

  // Method to store values
  void saveFormValues(String name, String email, String pass) {
    userName.value = name;
    emailID.value = email;
    password.value = pass;

    // Debugging
    if (userName.value.isEmpty ||
        emailID.value.isEmpty ||
        password.value.isEmpty) {
      debugPrint('Values are Empty');
    } else {
      debugPrint('Values are saved');
      // Calling createUser Method to Create and Store New User Account Information in Firebase
      createUser(userName.value, emailID.value, password.value);
    }
  }

  // Passing saved values to CreateUserUserCase class after initializing the Entity Class
  Future<void> createUser(String name, String email, String password) async {
    try {
      await createUserUseCase(
        SignUpUserEntity(name: name, email: email, password: password),
      );
    } catch (e) {
      debugPrint('Firestore error in SignUpController = $e');
    }
  }
}
