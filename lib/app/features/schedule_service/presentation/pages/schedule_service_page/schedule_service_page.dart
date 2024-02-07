// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:bike_service_app/app/core/constants/theme/colors/colors.dart';
import 'package:bike_service_app/app/core/constants/theme/textstyles/textstyle.dart';
import 'package:bike_service_app/app/global/widget_components/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../global/widget_components/app_bar/appbar.dart';
import '../../../../schedule_summary/presentation/pages/schedule_summary_page/schedule_summary_page.dart';
import '../../controllers/schedule_service_page_controller/schedule_service_page_controller.dart';

class ScheduleServicePage extends StatelessWidget {
  // next Unique Booking ID stored inside this variable
  final int? bookingId;
  ScheduleServicePage({super.key, this.bookingId});

  // controller
  final ScheduleServicePageController scheduleServicePageController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backSheetColor,
      appBar: appBar('Schedule Service'),
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
                    hintText: 'Example = Pulsar 150cc',
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
                    hintText: 'Example = RJ-36-4042',
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
                  height: 50,
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
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter your Mobile Number',
                    filled: true,
                    fillColor: AppColors.inputTextBoxInnerColor,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 10) {
                      return 'Please Enter your Mobile Number';
                    } else if (value.length > 10) {
                      return '10 Digit Mobile Number only';
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
                  height: 50,
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
                  height: 50,
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
                const SizedBox(
                  height: 50,
                ),
                // Heading [4]
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Schedule Service Timing',
                        style: AppTextStyleTheme.headingMainTitleText,
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        '[ Between 9:00 AM  -  4:00 PM ]',
                        style: AppTextStyleTheme.descriptionText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // service date
                Obx(
                  () => TextFormField(
                    showCursor: false,
                    enableInteractiveSelection: false,
                    controller: scheduleServicePageController
                        .serviceDateController.value,
                    keyboardType: TextInputType.none,
                    decoration: const InputDecoration(
                      labelText: 'Select Date',
                      filled: true,
                      fillColor: AppColors.inputTextBoxInnerColor,
                      border: OutlineInputBorder(),
                    ),
                    onTap: () async {
                      // Below line stops keyboard from appearing
                      FocusScope.of(context).requestFocus(FocusNode());

                      // Show Date Picker Here
                      try {
                        await scheduleServicePageController.selectDate(context);
                      } catch (e) {
                        debugPrint('error in date picker = $e');
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Select Service Date';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                //
                const SizedBox(
                  height: 15,
                ),
                // service Time
                Obx(
                  () => TextFormField(
                    showCursor: false,
                    enableInteractiveSelection: false,
                    controller: scheduleServicePageController
                        .serviceTimeController.value,
                    keyboardType: TextInputType.none,
                    decoration: const InputDecoration(
                      labelText: 'Select Time',
                      filled: true,
                      fillColor: AppColors.inputTextBoxInnerColor,
                      border: OutlineInputBorder(),
                    ),
                    onTap: () async {
                      // Below line stops keyboard from appearing
                      FocusScope.of(context).requestFocus(FocusNode());

                      // Show Time Picker Here
                      try {
                        await scheduleServicePageController.selectTime(context);
                      } catch (e) {
                        debugPrint('error in time picker = $e');
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Select Service Time';
                      } else if (value ==
                          DateFormat.jm().format(DateTime.now()).toString()) {
                        return 'Please Select New Service Time';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                // Button for navigating to ScheduleSummaryPage
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.mainButtonColor),
                  ),
                  onPressed: () {
                    // Checking if Form is Valid or not
                    if (scheduleServicePageController
                        .formKey.value.currentState!
                        .validate()) {
                      // if Form is valid without any error
                      // then we save the current state of form with values
                      scheduleServicePageController.formKey.value.currentState!
                          .save();

                      // Passing field values to next ScheduleSummaryPage
                      if (scheduleServicePageController
                          .selectedServicesListData.isEmpty) {
                        snackbarWidget('Alert', 'Select Desired Service !',
                            AppColors.snackBarColorWarning);
                      } else {
                        // creating new serviceStatus variable of type Map
                        // to store Default Service Status values
                        // we also pass this value to the ScheduleSummaryPage
                        var serviceStatus = {
                          "Service Status": {
                            "service": "Not Started",
                            "amount": "Pending"
                          }
                        };

                        // Navigating to ScheduleSummaryPage with valid Form field values
                        Get.to(
                          () => ScheduleSummaryPage(
                            bookingId: bookingId,
                            bikeName: scheduleServicePageController
                                .bikeNameController.value.text,
                            bikeNumber: scheduleServicePageController
                                .bikeNumberPlateController.value.text,
                            mobileNumber: scheduleServicePageController
                                .mobileNumberController.value.text,
                            fullAddress: scheduleServicePageController
                                .fullAdressController.value.text,
                            selectedServiceList: scheduleServicePageController
                                .selectedServicesListData
                                .toList(),
                            serviceDate: scheduleServicePageController
                                .serviceDateController.value.text,
                            serviceTime: scheduleServicePageController
                                .serviceTimeController.value.text,
                            serviceStatus: serviceStatus,
                          ),
                        );
                      }

                      // Debuging
                      // Checking saved Values
                      debugPrint('Form Saved');

                      debugPrint(
                          'bikeName = ${scheduleServicePageController.bikeNameController.value.text}');
                      debugPrint(
                          'bikeNumber = ${scheduleServicePageController.bikeNumberPlateController.value.text}');
                      debugPrint(
                          'mobileNumber = ${scheduleServicePageController.mobileNumberController.value.text}');
                      debugPrint(
                          'fullAddress = ${scheduleServicePageController.fullAdressController.value.text}');
                      debugPrint(
                          'selectedServiceList = ${scheduleServicePageController.selectedServicesListData.toList()}');
                      debugPrint(
                          'serviceDate = ${scheduleServicePageController.serviceDateController.value.text}');
                      debugPrint(
                          'serviceTime = ${scheduleServicePageController.serviceTimeController.value.text}');
                    } else {
                      // Showing Snackbar for user, so that they know that fields are Empty
                      snackbarWidget('Alert', 'Fill the Information !',
                          AppColors.snackBarColorWarning);

                      // Debuging
                      // Checking saved invalid Values
                      debugPrint('Current Form State is not valid');

                      debugPrint(
                          'bikeName = ${scheduleServicePageController.bikeNameController.value.text}');
                      debugPrint(
                          'bikeNumber = ${scheduleServicePageController.bikeNumberPlateController.value.text}');
                      debugPrint(
                          'mobileNumber = ${scheduleServicePageController.mobileNumberController.value.text}');
                      debugPrint(
                          'fullAddress = ${scheduleServicePageController.fullAdressController.value.text}');
                      debugPrint(
                          'selectedServiceList = ${scheduleServicePageController.selectedServicesListData.toList()}');
                      debugPrint(
                          'serviceDate = ${scheduleServicePageController.serviceDateController.value.text}');
                      debugPrint(
                          'serviceTime = ${scheduleServicePageController.serviceTimeController.value.text}');
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'View Receipt Summary >',
                      textAlign: TextAlign.center,
                      style: AppTextStyleTheme.buttonMainText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
