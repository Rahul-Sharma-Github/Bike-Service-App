import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/theme/colors/colors.dart';
import '../../../../../core/constants/theme/textstyles/textstyle.dart';
import '../../../../authentication/presentation/controllers/bottom_navigation/bottom_navigation_controller.dart';

class MyServicesPage extends StatelessWidget {
  MyServicesPage({super.key});

  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backSheetColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          'My Services',
          style: AppTextStyleTheme.appBarText,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: CircleAvatar(
              radius: 18,
              child: Icon(
                Icons.person_sharp,
                size: 28,
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)),
          color: AppColors.frontSheetColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [],
          ),
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
