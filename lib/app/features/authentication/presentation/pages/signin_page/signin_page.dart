// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/theme/colors/colors.dart';
import '../../../../../core/constants/theme/textstyles/textstyle.dart';
import '../../controllers/signin_page/signin_controller.dart';
import '../../widgets/header_widget.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  // controller
  final SignInController signInController = Get.find();

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
                subtitle: 'Sign In',
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
                      key: signInController.formKeySignIn.value,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Email
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Row(
                                  children: [
                                    Text('Email ID',
                                        style: AppTextStyleTheme
                                            .textFormFieldLabelText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller:
                                      signInController.emailController.value,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),
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
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Row(
                                  children: [
                                    Text('Password',
                                        style: AppTextStyleTheme
                                            .textFormFieldLabelText),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller:
                                      signInController.passwordController.value,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),
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
                          // Sign Up Page Link
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                const Text(
                                  'If you are New !',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Sign Up Button
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColors.mainButtonColor),
                            ),
                            onPressed: () async {
                              // Checking if Form is Valid or not
                              if (signInController
                                  .formKeySignIn.value.currentState!
                                  .validate()) {
                                // Debugging
                                debugPrint('Current Form State is valid');
                                // if Form is valid without any error
                                // then we save the current state of form with values
                                signInController
                                    .formKeySignIn.value.currentState!
                                    .save();

                                // Saving Form Field values
                                // Then Storing New User Account to Firebase Auth
                                signInController.saveFormValues(
                                    signInController.emailController.value.text,
                                    signInController
                                        .passwordController.value.text);

                                // Debuging
                                // Checking saved Values
                                debugPrint('Form Saved');

                                debugPrint(
                                    'email = ${signInController.emailController.value.text}');
                                debugPrint(
                                    'password = ${signInController.passwordController.value.text}');
                              } else {
                                // Debuging
                                // Checking saved invalid Values
                                debugPrint('Current Form State is not valid');

                                debugPrint(
                                    'email = ${signInController.emailController.value.text}');
                                debugPrint(
                                    'password = ${signInController.passwordController.value.text}');
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 14),
                              child: Text(
                                'Sign In',
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
