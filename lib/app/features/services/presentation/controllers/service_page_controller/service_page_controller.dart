import 'package:bike_service_app/app/features/services/domain/use_cases/service_page_usecase/service_page_usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicePageController extends GetxController {
  final ServicePageUseCase servicePageUseCase;

  ServicePageController(this.servicePageUseCase);

  // List of Maps for Featured Services List
  var serviceListData = [].obs;

  // List of Maps for Customer Testmonial List
  var customerTestimonialListData = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchServiceListData();
    fetchCustomerTestimonialListData();
  }

  // Fetching List of Maps for Featured Services List
  List<Map<String, dynamic>> fetchServiceListData() {
    return serviceListData.value = servicePageUseCase.callForServiceList();
  }

  // Fetching List of Maps for Customer Testmonial List
  List<Map<String, dynamic>> fetchCustomerTestimonialListData() {
    return customerTestimonialListData.value =
        servicePageUseCase.callForCustomerTestimonialList();
  }

  /// Other Functionalities for ServicesPage

  // Feature [1] ( to Open/Close the BottomSheet and to update currentIndex value on "Know More" button click )
  // variable to open / close the BottomSheet
  var isOpen = false.obs;

  // variable to change current selected card's index
  var currentIndex = 0.obs;

  // Method to Opoen/Close bottom sheet + to update the currentIndex value
  void bottomSheetShowClose(int index) {
    if (!isOpen.value) {
      currentIndex.value = index;
      isOpen.value = true;
    } else {
      isOpen.value = false;
    }
  }

  // Feature [2] ( to fetch the Total No. of Ducuments Count and store it inside the variable )
  // variable to store Document Count
  var nextBookingId = 0.obs;

  // Method to Fetch and store total no. of document count
  Future<void> fetchNextBookingId() async {
    // Returns number of documents in users collection
    await FirebaseFirestore.instance
        .collection("services")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("myservices")
        .count()
        .get()
        .then(
          (res) => nextBookingId.value = res.count!,
          onError: (e) =>
              debugPrint("Error fetching total no. of document count: $e"),
        );
  }
}
