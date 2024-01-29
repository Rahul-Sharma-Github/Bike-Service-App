import 'package:flutter/material.dart';

import '../../../../../core/constants/theme/colors/colors.dart';
import '../../../../../core/constants/theme/textstyles/textstyle.dart';

class ScheduleSummaryPage extends StatelessWidget {
  final String? bikeName;
  final String? bikeNumber;
  final String? mobileNumber;
  final String? fullAddress;
  final List<dynamic>? selectedServiceList;
  final String? serviceDate;
  final String? serviceTime;
  const ScheduleSummaryPage(
      {super.key,
      this.bikeName,
      this.bikeNumber,
      this.mobileNumber,
      this.fullAddress,
      this.selectedServiceList,
      this.serviceDate,
      this.serviceTime});

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
          'Schedule Summary',
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
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: AppColors.inputTextBoxInnerColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    // Main Title
                    Row(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Booking ID',
                            textAlign: TextAlign.left,
                            style: AppTextStyleTheme.scheduleSummaryKeyText,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '10102',
                            textAlign: TextAlign.left,
                            style: AppTextStyleTheme.scheduleSummaryValueText,
                          ),
                        ),
                      ],
                    ),
                    // 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Bike Number',
                            textAlign: TextAlign.left,
                            style: AppTextStyleTheme.scheduleSummaryKeyText,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'RJ-36-4042',
                            textAlign: TextAlign.left,
                            style: AppTextStyleTheme.scheduleSummaryValueText,
                          ),
                        ),
                      ],
                    ),
                    // 3
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Bike Name',
                            textAlign: TextAlign.left,
                            style: AppTextStyleTheme.scheduleSummaryKeyText,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Pulsar 150 cc',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      decoration:
                          BoxDecoration(border: Border(bottom: BorderSide())),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Service Name',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Service Price',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 1 [ ListView.builder ]
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Regular Tune-up',
                            textAlign: TextAlign.left,
                            style: AppTextStyleTheme.scheduleSummaryKeyText,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '350',
                            textAlign: TextAlign.left,
                            style: AppTextStyleTheme.scheduleSummaryValueText,
                          ),
                        ),
                      ],
                    ),
                    // Footer
                    Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(horizontal: BorderSide())),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Total',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '350',
                              textAlign: TextAlign.left,
                              style: AppTextStyleTheme.scheduleSummaryValueText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Schedule Timing
                    Row(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Service Starting Date',
                            textAlign: TextAlign.left,
                            style: AppTextStyleTheme.scheduleSummaryKeyText,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Jan 22, 2024',
                            textAlign: TextAlign.left,
                            style: AppTextStyleTheme.scheduleSummaryValueText,
                          ),
                        ),
                      ],
                    ),
                    // 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Service Starting Time',
                            textAlign: TextAlign.left,
                            style: AppTextStyleTheme.scheduleSummaryKeyText,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '9:30 AM',
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
                        Expanded(
                          child: Text(
                            'Service Ending Time',
                            textAlign: TextAlign.left,
                            style: AppTextStyleTheme.scheduleSummaryKeyText,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '[ After Service we will inform you, on your Registered Number = 2564879581 ]',
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
                    Row(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                            '568974589',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    Row(
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
                onPressed: () {
                  debugPrint('Bike Name = $bikeName');
                  debugPrint('Bike Number = $bikeNumber');
                  debugPrint('Mobile Number = $mobileNumber');
                  debugPrint('Full Address = $fullAddress');
                  debugPrint('Selected Service List = $selectedServiceList');
                  debugPrint('Service Date = $serviceDate');
                  debugPrint('Service Time = $serviceTime');
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
    );
  }
}
