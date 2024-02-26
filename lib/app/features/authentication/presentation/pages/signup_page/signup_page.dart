// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:bike_service_app/app/core/constants/theme/colors/colors.dart';
import 'package:bike_service_app/app/core/constants/theme/textstyles/textstyle.dart';
import 'package:bike_service_app/app/features/authentication/presentation/pages/signin_page/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/signup_page/signup_controller.dart';
import '../../widgets/header_widget.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final SignUpController signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // avoid keyboard overlape
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backSheetColor,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              const HeaderWidget(
                title: 'WELCOME',
                subtitle: 'Sign Up',
              ),
              const SizedBox(
                height: 15,
              ),
              // TextFormFields
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 24.0),
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32.0)),
                    color: AppColors.frontSheetColor,
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: signUpController.formKeySignUp.value,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Name
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Row(
                                  children: [
                                    Text('Enter User Name',
                                        style: AppTextStyleTheme
                                            .textFormFieldLabelText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller:
                                      signUpController.nameController.value,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 15),
                                    filled: true,
                                    fillColor: AppColors.inputTextBoxInnerColor,
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Name';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          // Email
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Row(
                                  children: [
                                    Text('Enter Email ID',
                                        style: AppTextStyleTheme
                                            .textFormFieldLabelText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller:
                                      signUpController.emailController.value,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 15),
                                    filled: true,
                                    fillColor: AppColors.inputTextBoxInnerColor,
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@')) {
                                      return 'Please Enter Valid Email';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          // Password
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Row(
                                  children: [
                                    Text('Enter Password',
                                        style: AppTextStyleTheme
                                            .textFormFieldLabelText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller:
                                      signUpController.passwordController.value,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 15),
                                    filled: true,
                                    fillColor: AppColors.inputTextBoxInnerColor,
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Password';
                                    } else if (value.length < 8) {
                                      return 'Please enter password of minimum length 8';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // Sign In Page Link
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => SignInPage());
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                const Text(
                                  'If you already have Account !',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          // Sign Up Button
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.mainButtonColor),
                            ),
                            onPressed: () async {
                              // Checking if Form is Valid or not
                              if (signUpController
                                  .formKeySignUp.value.currentState!
                                  .validate()) {
                                // if Form is valid without any error
                                // then we save the current state of form with values
                                signUpController
                                    .formKeySignUp.value.currentState!
                                    .save();

                                // Saving Form Field values
                                // Then Storing New User Account to Firebase Auth
                                signUpController.saveFormValues(
                                    signUpController.nameController.value.text,
                                    signUpController.emailController.value.text,
                                    signUpController
                                        .passwordController.value.text);
                              } else {}
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'Sign Up',
                                style: AppTextStyleTheme.buttonMainText,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
