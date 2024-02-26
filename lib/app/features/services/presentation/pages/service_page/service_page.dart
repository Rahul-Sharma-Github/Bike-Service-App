// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:bike_service_app/app/core/constants/theme/colors/colors.dart';
import 'package:bike_service_app/app/core/constants/theme/textstyles/textstyle.dart';
import 'package:bike_service_app/app/features/services/presentation/controllers/service_page_controller/service_page_controller.dart';
import 'package:bike_service_app/app/global/widget_components/app_bar/appbar.dart';
import 'package:bike_service_app/app/global/widget_components/snackbar/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../schedule_service/presentation/pages/schedule_service_page/schedule_service_page.dart';

class ServicePage extends StatelessWidget {
  ServicePage({super.key});

  // controller
  final ServicePageController servicePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backSheetColor,
      appBar: appBar('Services'),
      // drawer: DrawerWidget(),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              // Featured Services Part

              // Heading
              const Row(
                children: [
                  Text(
                    'Check Our Featured Services',
                    style: AppTextStyleTheme.headingMainTitleText,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // ListView.builder for Featured Services
              SizedBox(
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: servicePageController.serviceListData.length,
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
                              child: Container(
                                child: Image.asset(servicePageController
                                    .serviceListData[index]["image"]),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              servicePageController
                                                      .serviceListData[index]
                                                  ["name"],
                                              style: AppTextStyleTheme
                                                  .cardTitleText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                        const LinearBorder()),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        AppColors
                                                            .knowMoreButtonColor),
                                              ),
                                              onPressed: () {
                                                servicePageController
                                                    .bottomSheetShowClose(
                                                        index);
                                              },
                                              child: const Text('Know More',
                                                  style: AppTextStyleTheme
                                                      .cardButtonText),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                height: 35,
              ),

              // Customer Testimonial Part

              // Heading
              const Row(
                children: [
                  Text(
                    'What customer says about us',
                    style: AppTextStyleTheme.headingMainTitleText,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // ListView.builder for Customer Testimonials
              SizedBox(
                height: 350,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      servicePageController.customerTestimonialListData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 350,
                      width: 250,
                      child: Card(
                          surfaceTintColor: AppColors.backSheetColor,
                          shadowColor: AppColors.serviceCardColor,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.format_quote),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          servicePageController
                                                  .customerTestimonialListData[
                                              index]["description"],
                                          style: AppTextStyleTheme
                                              .customerAddressText,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            servicePageController
                                                    .customerTestimonialListData[
                                                index]["name"],
                                            style: AppTextStyleTheme
                                                .customerNameText,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            servicePageController
                                                    .customerTestimonialListData[
                                                index]["city"],
                                            style: AppTextStyleTheme
                                                .customerAddressText,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              // Schedule Bike Service Button
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.mainButtonColor),
                ),
                onPressed: () async {
                  // fetching and storing nextBookingId number | and then passing it to next page ( ScheduleServicePage )
                  try {
                    await servicePageController.fetchNextBookingId();
                    snackbarWidget(
                        'New Booking ID Generated !',
                        '[ Booking ID = ${servicePageController.nextBookingId.value} ]',
                        AppColors.snackBarColorSuccess);

                    await Get.to(() => ScheduleServicePage(
                          bookingId: servicePageController.nextBookingId.value,
                        ));
                  } catch (e) {
                    debugPrint(
                        'error in ServicePage while Fetching Next BookingID & Navigating to ScheduleServicePage = $e');
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Schedule Bike Service',
                        style: AppTextStyleTheme.buttonMainText,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.arrow_right_alt_sharp, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      ),

      // BottomSheet

      // This BottomSheet will Open / Close according to current value of ( isOpen ) Bool variable
      bottomSheet: Obx(
        () => servicePageController.isOpen.value
            ? BottomSheet(
                showDragHandle: false,
                enableDrag: false,
                onClosing: () {},
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  servicePageController.serviceListData[
                                      servicePageController
                                          .currentIndex.value]["name"],
                                  style: AppTextStyleTheme.cardTitleText,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Text(
                                    servicePageController.serviceListData[
                                        servicePageController
                                            .currentIndex.value]["description"],
                                    style: AppTextStyleTheme.descriptionText,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.mainButtonColor),
                          ),
                          onPressed: () {
                            servicePageController.bottomSheetShowClose(0);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Close',
                              style: AppTextStyleTheme.closeButtonText,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              )
            : const SizedBox(),
      ),
    );
  }
}
