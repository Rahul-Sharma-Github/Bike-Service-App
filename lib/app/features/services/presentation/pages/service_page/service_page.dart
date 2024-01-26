// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:bike_service_app/app/core/constants/theme/colors/colors.dart';
import 'package:bike_service_app/app/core/constants/theme/textstyles/textstyle.dart';
import 'package:bike_service_app/app/features/services/presentation/controllers/service_page_controller/service_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicePage extends StatelessWidget {
  ServicePage({super.key});

  final ServicePageController servicePageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backSheetColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          'Services',
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
                                              onPressed: () {},
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
                height: 150,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: servicePageController.serviceListData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      width: 250,
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        elevation: 5,
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
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        servicePageController
                                            .serviceListData[index]["name"],
                                        style: AppTextStyleTheme.cardTitleText,
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            const LinearBorder()),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.knowMoreButtonColor),
                                      ),
                                      onPressed: () {},
                                      child: const Text('Know More',
                                          style:
                                              AppTextStyleTheme.cardButtonText),
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
                height: 45,
              ),
              // Schedule Bike Service Button
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.mainButtonColor),
                ),
                onPressed: () {
                  // Get.to(() => ScheduleServicePage());
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Schedule Bike Service  >',
                    style: AppTextStyleTheme.buttonMainText,
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
    );
  }
}
