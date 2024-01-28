import 'package:bike_service_app/app/features/schedule_service/domain/use_cases/schedule_service_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleServicePageController extends GetxController {
  final ScheduleServicePageUseCase scheduleServicePageUseCase;

  ScheduleServicePageController(this.scheduleServicePageUseCase);

  // TextFormField Controllers
  final bikeNameController = TextEditingController().obs;
  final bikeNumberPlateController = TextEditingController().obs;
  final mobileNumberController = TextEditingController().obs;
  final fullAdressController = TextEditingController().obs;
  final describeHereController = TextEditingController().obs;
  final serviceDateController = TextEditingController().obs;
  final serviceTimeController = TextEditingController().obs;

  // Form Global Key
  final formKey = GlobalKey<FormState>().obs;

  ///
  // List of Maps for Services List
  var servicesListData = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchServicesListData();
  }

// Fetching List of Maps for Services List
  List<Map<String, dynamic>> fetchServicesListData() {
    return servicesListData.value =
        scheduleServicePageUseCase.callForServicesList();
  }

  /////////
  // List of Maps for Selected Services List Data
  var selectedServicesListData = [].obs;

  List<bool> isChecked = [false, false, false, false, false].obs;
}
