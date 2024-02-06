// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/assets_path/asset_path.dart';
import '../../../../../core/constants/theme/colors/colors.dart';
import '../../../../../core/constants/theme/textstyles/textstyle.dart';
import '../../../../services/presentation/pages/service_page/service_page.dart';
import '../../controllers/bottom_navigation/bottom_navigation_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backSheetColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // Display Signed In User Name after Welcome text after fetching from Database
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
              height: 16,
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
                        padding: EdgeInsets.all(6.0),
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
              height: 14,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 14.0),
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32.0)),
                  color: AppColors.frontSheetColor,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Image.asset(AssetPaths.bikeImage, scale: 1.8),
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
                        height: 22,
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
                          Get.to(() => ServicePage());
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
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: AppColors.backSheetColor,
          currentIndex: bottomNavigationController.tabIndex.value,
          selectedItemColor: AppColors.frontSheetColor,
          unselectedItemColor: AppColors.frontSheetColor.withOpacity(0.5),
          onTap: (value) {
            bottomNavigationController.changeTabIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.auto_awesome_motion_rounded,
              ),
              label: 'Services',
            ),
          ],
        ),
      ),
    );
  }
}
