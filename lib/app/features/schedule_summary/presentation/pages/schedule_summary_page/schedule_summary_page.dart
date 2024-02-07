import 'package:bike_service_app/app/features/authentication/presentation/pages/landing_page/landing_page.dart';
import 'package:bike_service_app/app/features/schedule_summary/domain/entities/service_entity.dart';
import 'package:bike_service_app/app/global/widget_components/app_bar/appbar.dart';
import 'package:bike_service_app/app/global/widget_components/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/theme/colors/colors.dart';
import '../../../../../core/constants/theme/textstyles/textstyle.dart';
import '../../controllers/schedule_summary_controller/schedule_summary_controller.dart';

class ScheduleSummaryPage extends StatelessWidget {
  final int? bookingId;
  final String? bikeName;
  final String? bikeNumber;
  final String? mobileNumber;
  final String? fullAddress;
  final List<dynamic>? selectedServiceList;
  final String? serviceDate;
  final String? serviceTime;
  final Map<String, Map<String, dynamic>>? serviceStatus;
  ScheduleSummaryPage(
      {super.key,
      this.bikeName,
      this.bikeNumber,
      this.mobileNumber,
      this.fullAddress,
      this.selectedServiceList,
      this.serviceDate,
      this.serviceTime,
      this.bookingId,
      this.serviceStatus});

  // Getting Instance of scheduleSummaryController each time we call the ScheduleSummaryPage Class
  final ScheduleSummaryController scheduleSummaryController = Get.find();

  @override
  Widget build(BuildContext context) {
    // Back Navigation Logic while using AlertDialog
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        // if true then return nothing
        if (didPop) {
          return;
        }
        // if false then return AlertDialog Widget
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Do you want to Edit this ?'),
            actions: [
              OutlinedButton(
                onPressed: () {
                  // if user click on Yes then,

                  // First close the Dialog
                  Get.back();
                  // Then close the current page and go back
                  Get.back();
                },
                child: const Text('Yes'),
              ),
              OutlinedButton(
                onPressed: () {
                  // if user click on No then,

                  // Just close the dialog
                  Get.back();
                },
                child: const Text('No'),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.backSheetColor,
        // Schedule Summary
        appBar: appBar('Schedule Summary'),
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
              children: [
                // Main Container for Bill Summary
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: const BoxDecoration(
                    // border: Border.all(),
                    color: AppColors.inputTextBoxInnerColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      // Main Title
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Ganpati Motors',
                              textAlign: TextAlign.center,
                              style: AppTextStyleTheme.scheduleSummaryTitleText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Bike Information
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Bike Information',
                              textAlign: TextAlign.left,
                              style:
                                  AppTextStyleTheme.scheduleSummarySubTitleText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // 1
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'Booking ID',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryKeyText,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '$bookingId',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                        ],
                      ),
                      // 2
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'Bike Number',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryKeyText,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '$bikeNumber',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                        ],
                      ),
                      // 3
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'Bike Name',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryKeyText,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '$bikeName',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Service Charges
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Service Charges',
                              textAlign: TextAlign.left,
                              style:
                                  AppTextStyleTheme.scheduleSummarySubTitleText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Heading
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide())),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Service Name',
                                textAlign: TextAlign.left,
                                style:
                                    AppTextStyleTheme.scheduleSummaryValueText,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Service Price',
                                textAlign: TextAlign.left,
                                style:
                                    AppTextStyleTheme.scheduleSummaryValueText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // 1 [ ListView.builder ]
                      SizedBox(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: selectedServiceList!.length,
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 1.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${selectedServiceList![index]['name']}',
                                      textAlign: TextAlign.left,
                                      style: AppTextStyleTheme
                                          .scheduleSummaryKeyText,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${selectedServiceList![index]['price']}',
                                      textAlign: TextAlign.left,
                                      style: AppTextStyleTheme
                                          .scheduleSummaryValueText,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                        ),
                      ),

                      // Footer
                      Container(
                        decoration: const BoxDecoration(
                            border: Border.symmetric(horizontal: BorderSide())),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                'Total',
                                textAlign: TextAlign.left,
                                style:
                                    AppTextStyleTheme.scheduleSummaryValueText,
                              ),
                            ),
                            Expanded(
                              child: Obx(
                                () => Text(
                                  scheduleSummaryController
                                      .totalPriceResult(selectedServiceList)
                                      .toString(),
                                  textAlign: TextAlign.left,
                                  style: AppTextStyleTheme
                                      .scheduleSummaryValueText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Schedule Timing
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Schedule Timing',
                              textAlign: TextAlign.left,
                              style:
                                  AppTextStyleTheme.scheduleSummarySubTitleText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // 1
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'Service Starting Date',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryKeyText,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '$serviceDate',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                        ],
                      ),
                      // 2
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'Service Starting Time',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryKeyText,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '$serviceTime',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                        ],
                      ),
                      // 3
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Text(
                              'Service Ending Time',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryKeyText,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '[ After Service we will inform you, on your Registered Number = $mobileNumber ]',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Payment Option
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Payment Option',
                              textAlign: TextAlign.left,
                              style:
                                  AppTextStyleTheme.scheduleSummarySubTitleText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // 1
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Online Payment UPI No.',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryKeyText,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'xxxxxxxxxx',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                        ],
                      ),

                      // 2
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Offline Option',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryKeyText,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '[ You can pay on the service center ]',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Payment Option
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Service Center Address',
                              textAlign: TextAlign.left,
                              style:
                                  AppTextStyleTheme.scheduleSummarySubTitleText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // 1
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Address',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryKeyText,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '[ Ganpati Motor Services, Krishna Nagar Sendra Road, Beawar, Rajasthan 305901 ]',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                // Button
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.mainButtonColor),
                  ),
                  onPressed: () async {
                    //Debugging
                    // checking values
                    debugPrint('Bike Name = $bikeName');
                    debugPrint('Bike Number = $bikeNumber');
                    debugPrint('Mobile Number = $mobileNumber');
                    debugPrint('Full Address = $fullAddress');
                    debugPrint('Selected Service List = $selectedServiceList');
                    debugPrint(
                        'Total No. of Services = ${selectedServiceList!.length}');
                    debugPrint(
                        'Total Price of Service = ${scheduleSummaryController.totalPrice}');
                    debugPrint('Service Date = $serviceDate');
                    debugPrint('Service Time = $serviceTime');
                    debugPrint('Service Status = $serviceStatus');

                    // Sending Values/Arguments to createService() Method of scheduleSummaryController to create a new Service
                    try {
                      await scheduleSummaryController.createService(
                        bookingId.toString(),
                        bikeName!,
                        bikeNumber!,
                        mobileNumber!,
                        fullAddress!,
                        serviceDate!,
                        serviceTime!,
                        '0000000000',
                        // making List<classes> from List<Maps> & Passing it to createService Method of scheduleSummaryController
                        List<SelectedServiceList>.from(
                            selectedServiceList!
                                .map(
                                  (x) => SelectedServiceList(
                                    serviceName: x["name"],
                                    servicePrice: x["price"],
                                  ),
                                )
                                .toList(),
                            growable: true),
                        scheduleSummaryController.totalPrice.value.toString(),
                        // making single class object from Map<String,<String, dynamic>>
                        ServiceStatus.fromMap(
                            serviceStatus!["Service Status"]!),
                      );

                      // Showing Success Message
                      snackbarWidget('Success', 'Service Scheduled !',
                          AppColors.snackBarColorSuccess);

                      // Form will be Automatically Reset

                      // Go to landingPage -> HomePage and clear all route from Route Stack
                      Get.offAll(() => LandingPage());
                    } catch (e) {
                      debugPrint(
                          'error while calling createService() Method of scheduleSummaryController through ScheduleSummaryPage =  $e');
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Confirm This Service',
                      textAlign: TextAlign.center,
                      style: AppTextStyleTheme.buttonMainText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
