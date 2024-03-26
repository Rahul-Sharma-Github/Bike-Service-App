// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../my_services/presentation/pages/my_services_page/my_services_page.dart';
import '../../controllers/bottom_navigation/bottom_navigation_controller.dart';
import '../home_page/home_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  // controller
  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    // Showing Page according to current tabIndex value
    return Obx(() => IndexedStack(
          index: bottomNavigationController.tabIndex.value,
          children: [
            HomePage(),
            MyServicesPage(),
          ],
        ));
  }
}
