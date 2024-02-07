// ignore_for_file: avoid_unnecessary_containers

import 'package:bike_service_app/app/features/my_services/presentation/widgets/empty_widget.dart';
import 'package:bike_service_app/app/global/widget_components/app_bar/appbar.dart';
import 'package:bike_service_app/app/global/widget_components/drawer/drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/theme/colors/colors.dart';
import '../../../../../core/constants/theme/textstyles/textstyle.dart';
import '../../../../authentication/presentation/controllers/bottom_navigation/bottom_navigation_controller.dart';
import '../../controllers/my_services_controller.dart';

class MyServicesPage extends StatelessWidget {
  MyServicesPage({super.key});

  // for dealing with BottomNavigationBar
  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  // for dealing with  Stream<QuerySnapshot<Map<String, dynamic>>> type data
  final MyServicesController myServicesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backSheetColor,
      appBar: appBar('My Services'),
      drawer: drawerWidget(),
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
              const Row(
                children: [
                  Expanded(
                    child: Text(
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
              Container(
                child: StreamBuilder(
                  stream: myServicesController.fetchStreamData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: EmptyWidget(),
                      );
                    } else {
                      return ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          // Getting each Document by index
                          QueryDocumentSnapshot<Map<String, dynamic>>?
                              docSnapshot = snapshot.data?.docs[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Card(
                              margin: EdgeInsets.zero,
                              color: AppColors.serviceCardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Left side
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              border:
                                                  Border(right: BorderSide()),
                                            ),
                                            child: Column(
                                              children: [
                                                // title
                                                const Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Ganpati Motors',
                                                        style: AppTextStyleTheme
                                                            .myServicesCardTitleText,
                                                        textAlign:
                                                            TextAlign.center,
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
                                                    const Expanded(
                                                      child: Text(
                                                        'Booking ID',
                                                        style: AppTextStyleTheme
                                                            .scheduleSummaryKeyText,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        docSnapshot?[
                                                            'Booking ID'],
                                                        style: AppTextStyleTheme
                                                            .scheduleSummaryValueText,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                const Row(
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
                                                        docSnapshot?[
                                                            'Bike Number'],
                                                        style: AppTextStyleTheme
                                                            .scheduleSummaryValueText,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(endIndent: 10),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        docSnapshot?[
                                                            'Service Date'],
                                                        style: AppTextStyleTheme
                                                            .myServicesCardDateText,
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
                                                        docSnapshot?[
                                                            'Service Time'],
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
                                                const Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'Service Status',
                                                        style: AppTextStyleTheme
                                                            .myServicesCardTitleText,
                                                        textAlign:
                                                            TextAlign.center,
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
                                                    const Expanded(
                                                      child: Text(
                                                        'Service',
                                                        style: AppTextStyleTheme
                                                            .scheduleSummaryKeyText,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(1),
                                                        color: (docSnapshot?[
                                                                        'Service Status']
                                                                    [
                                                                    'service'] ==
                                                                'Not Started')
                                                            ? AppColors
                                                                .notStartedBoxColor
                                                            : (docSnapshot?['Service Status']
                                                                        [
                                                                        'service'] ==
                                                                    'Running')
                                                                ? AppColors
                                                                    .pendingOrRuningBoxColor
                                                                : AppColors
                                                                    .doneOrPaidBoxColor,
                                                        child: Text(
                                                          docSnapshot?[
                                                                  'Service Status']
                                                              ['service'],
                                                          style: AppTextStyleTheme
                                                              .myServicesCardServiceStatusValueText,
                                                          textAlign:
                                                              TextAlign.center,
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
                                                    const Expanded(
                                                      child: Text(
                                                        'Amount',
                                                        style: AppTextStyleTheme
                                                            .scheduleSummaryKeyText,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(1),
                                                        color: (docSnapshot?[
                                                                        'Service Status']
                                                                    [
                                                                    'amount'] ==
                                                                'Pending')
                                                            ? AppColors
                                                                .pendingOrRuningBoxColor
                                                            : (docSnapshot?['Service Status']
                                                                        [
                                                                        'amount'] ==
                                                                    'Paid')
                                                                ? AppColors
                                                                    .doneOrPaidBoxColor
                                                                : AppColors
                                                                    .notStartedBoxColor,
                                                        child: Text(
                                                          docSnapshot?[
                                                                  'Service Status']
                                                              ['amount'],
                                                          style: AppTextStyleTheme
                                                              .myServicesCardServiceStatusValueText,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Divider(indent: 10),
                                                Row(
                                                  children: [
                                                    const Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 5),
                                                        child: Text(
                                                          'Total Amount',
                                                          style: AppTextStyleTheme
                                                              .scheduleSummaryKeyText,
                                                          textAlign:
                                                              TextAlign.right,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        docSnapshot?[
                                                            'Total Price'],
                                                        style: AppTextStyleTheme
                                                            .scheduleSummaryValueText,
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
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
                          );
                        },
                      );
                    }
                  },
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
