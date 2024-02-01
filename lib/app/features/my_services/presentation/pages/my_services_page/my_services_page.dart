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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Heading
              Row(
                children: [
                  Expanded(
                    child: const Text(
                      'Your Services',
                      style: AppTextStyleTheme.scheduleSummaryTitleText,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Service Card
              Card(
                margin: EdgeInsets.zero,
                color: AppColors.serviceCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left side
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(right: BorderSide()),
                              ),
                              child: Column(
                                children: [
                                  // title
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Ganpati Motors',
                                          style: AppTextStyleTheme
                                              .myServicesCardTitleText,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  // values
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Booking ID',
                                          style: AppTextStyleTheme
                                              .scheduleSummaryKeyText,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '10103',
                                          style: AppTextStyleTheme
                                              .scheduleSummaryValueText,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Bike Number',
                                          style: AppTextStyleTheme
                                              .scheduleSummaryKeyText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'RJ-36-4242',
                                          style: AppTextStyleTheme
                                              .scheduleSummaryValueText,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Feb 12, 2024',
                                          style: AppTextStyleTheme
                                              .myServicesCardDateText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Right side
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  // title
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Service Status',
                                          style: AppTextStyleTheme
                                              .myServicesCardTitleText,
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  // values
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Service',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(1),
                                          color: AppColors.notStartedBoxColor,
                                          child: Text(
                                            'Not Started',
                                            style: AppTextStyleTheme
                                                .myServicesCardServiceStatusValueText,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Amount',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(1),
                                          color:
                                              AppColors.pendingOrRuningBoxColor,
                                          child: Text(
                                            'Pending',
                                            style: AppTextStyleTheme
                                                .myServicesCardServiceStatusValueText,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
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
