import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/service_entity.dart';
import '../../../domain/use_cases/schedule_summary_use_case.dart';

class ScheduleSummaryController extends GetxController {
  final CreateServiceUseCase createServiceUseCase;

  ScheduleSummaryController(this.createServiceUseCase);

  // Method to pass all form values to the ServiceEntity Model class to instanciate it &
  // passing the Instance of ServiceEntity Model class to createServiceUseCase class
  Future<void> createService(
      int bookingId,
      String bikeName,
      String bikeNumber,
      String mobileNumber,
      String fullAddress,
      String serviceDate,
      String serviceTime,
      String onlinePaymentUpiNumber,
      List<SelectedServiceList> selectedServiceList,
      String totalPrice,
      ServiceStatus serviceStatus) async {
    try {
      await createServiceUseCase(
        // passing instance of ServiceEntity Model class while Initializing it
        ServiceEntity(
            bookingId: bookingId,
            bikeName: bikeName,
            bikeNumber: bikeNumber,
            mobileNumber: mobileNumber,
            fullAddress: fullAddress,
            serviceDate: serviceDate,
            serviceTime: serviceTime,
            onlinePaymentUpiNumber: onlinePaymentUpiNumber,
            selectedServiceList: selectedServiceList,
            serviceStatus: serviceStatus,
            totalPrice: totalPrice),
      );
    } catch (e) {
      debugPrint(
          'Error in ScheduleSummaryController while both operations - Initializing ServiceEntity Model class & Passing it\'s Instance to CreateServiceUseCase class  = $e');
    }
  }

  /// Other Functionality
// variable to store Total price of all selected services in the ScheduleSummaryPage
  var price = 0.obs;

  var totalPrice = 0.obs;

  // Method for calculating & returning total price of all selectedServices
  int totalPriceResult(List<dynamic>? selectedServiceList) {
    // resetting values on every call
    price.value = 0;
    totalPrice.value = 0;
    // iterating through all selected services
    for (var element in selectedServiceList!) {
      price.value = (price.value + element['price']).toInt();
    }
    return totalPrice.value = price.value;
  }
}
