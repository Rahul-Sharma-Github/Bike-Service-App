// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:bike_service_app/app/core/constants/theme/textstyles/textstyle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/assets_path/asset_path.dart';
import '../../../../../core/constants/theme/colors/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backSheetColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Welcome',
          style: AppTextStyleTheme.welcomeHeadingTitleText,
        ),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 26,
            ),
            Container(
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ganpati Motors',
                        style: AppTextStyleTheme.welcomeHeadingSubtitleText,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '"Your Bike\'s Best Companion"',
                          style: AppTextStyleTheme
                              .welcomeHeadingSubtitleDescriptionText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
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
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(AssetPaths.bikeImage),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Text(
                            'Get ready for a smoother ride!',
                            textAlign: TextAlign.center,
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                'Ganpati Motor Service is here to make bike maintenance hassle-free. From quick fixes to regular check-ups, we\'ve got you covered',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                      // Get Started Button
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.mainButtonColor),
                        ),
                        onPressed: () {
                          Get.snackbar('Services Page', 'Work in Progress !',
                              colorText: Colors.white);
                          FirebaseAuth.instance.signOut();
                          Get.snackbar('Current User', 'Signed Out !',
                              colorText: Colors.white);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Get Started  >',
                            style: AppTextStyleTheme.buttonMainText,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 34,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
