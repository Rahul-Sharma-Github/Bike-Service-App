// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:bike_service_app/app/core/constants/theme/colors/colors.dart';
import 'package:bike_service_app/app/core/constants/theme/textstyles/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/schedule_service_page_controller/schedule_service_page_controller.dart';

class ScheduleServicePage extends StatelessWidget {
  // next Unique Booking ID stored inside this variable
  final int? bookingId;
  ScheduleServicePage({super.key, this.bookingId});

  final ScheduleServicePageController scheduleServicePageController =
      Get.find();

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
          'Schedule Service',
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
          // Form ( Bike Details for Scheduling the Service )
          child: Form(
            key: scheduleServicePageController.formKey.value,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Heading [1]
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Your bike details',
                        style: AppTextStyleTheme.headingMainTitleText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                // bike name/model
                TextFormField(
                  controller:
                      scheduleServicePageController.bikeNameController.value,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Enter Bike Name / Model',
                    filled: true,
                    fillColor: AppColors.inputTextBoxInnerColor,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Bike Name/Model';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                // bike plate number
                TextFormField(
                  controller: scheduleServicePageController
                      .bikeNumberPlateController.value,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Enter Bike Number Plate Detail',
                    filled: true,
                    fillColor: AppColors.inputTextBoxInnerColor,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Bike Number Plate Details';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                // Heading [2]
                const Row(
                  children: [
                    Text(
                      'Contact Information',
                      style: AppTextStyleTheme.headingMainTitleText,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                // Mobile number
                TextFormField(
                  controller: scheduleServicePageController
                      .mobileNumberController.value,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Mobile Number',
                    filled: true,
                    fillColor: AppColors.inputTextBoxInnerColor,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter your Mobile Number';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                // Full Address
                TextFormField(
                  controller:
                      scheduleServicePageController.fullAdressController.value,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Full Address',
                    filled: true,
                    fillColor: AppColors.inputTextBoxInnerColor,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter your Full Address';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                // Heading [3]
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Select services for your bike',
                        style: AppTextStyleTheme.headingMainTitleText,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'To choose the service, just check the Box',
                        style: AppTextStyleTheme.descriptionText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                // Services List with Checkbox
                SizedBox(
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    itemCount:
                        scheduleServicePageController.servicesListData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 150,
                        padding: const EdgeInsets.all(0),
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          color: AppColors.serviceCardColor,
                          elevation: 4,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Image.asset(
                                      scheduleServicePageController
                                          .servicesListData[index]["image"]),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            scheduleServicePageController
                                                    .servicesListData[index]
                                                ["name"],
                                            style:
                                                AppTextStyleTheme.cardTitleText,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Obx(
                                    () => Checkbox(
                                      value: scheduleServicePageController
                                          .isChecked[index],
                                      onChanged: (bool? value) {
                                        scheduleServicePageController
                                            .isChecked[index] = value!;
                                        if (scheduleServicePageController
                                            .isChecked[index]) {
                                          debugPrint('true');
                                          scheduleServicePageController
                                              .selectedServicesListData
                                              .add(scheduleServicePageController
                                                  .servicesListData[index]);
                                          debugPrint(
                                              '${scheduleServicePageController.selectedServicesListData}');
                                        } else {
                                          debugPrint('false');
                                          scheduleServicePageController
                                              .selectedServicesListData
                                              .removeWhere(
                                            (element) =>
                                                element['name'] ==
                                                scheduleServicePageController
                                                        .servicesListData[index]
                                                    ['name'],
                                          );
                                          debugPrint(
                                              '${scheduleServicePageController.selectedServicesListData}');
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Any additional issues in your bike ?',
                        style: AppTextStyleTheme.descriptionText,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Describe Here - ',
                        style: AppTextStyleTheme.descriptionText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                // Additional Issues
                TextFormField(
                  maxLines: 4,
                  controller: scheduleServicePageController
                      .describeHereController.value,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Describe here [ Optional ]',
                    filled: true,
                    fillColor: AppColors.inputTextBoxInnerColor,
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
