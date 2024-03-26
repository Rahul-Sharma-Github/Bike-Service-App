// ignore_for_file: use_build_context_synchronously

import 'package:bike_service_app/app/features/client_panel/schedule_service/domain/use_cases/schedule_service_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleServicePageController extends GetxController {
  final ScheduleServicePageUseCase scheduleServicePageUseCase;

  ScheduleServicePageController(this.scheduleServicePageUseCase);

  /// Form
  // Form Global Key
  final formKey = GlobalKey<FormState>().obs;

  // TextFormField Controllers
  final bikeNameController = TextEditingController().obs;
  final bikeNumberPlateController = TextEditingController().obs;
  final mobileNumberController = TextEditingController().obs;
  final fullAdressController = TextEditingController().obs;
  final describeHereController = TextEditingController().obs;
  final serviceDateController = TextEditingController(
          text: DateFormat.yMMMEd().format(DateTime.now()).toString())
      .obs;
  final serviceTimeController =
      TextEditingController(text: DateFormat.jm().format(DateTime.now())).obs;

  /// List of Maps with Checkbox Logic
  // List of Maps Variable for Fetching Services List
  var servicesListData = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchServicesListData();
  }

  // List of Maps Variable for Storing Selected Services List Data
  var selectedServicesListData = [].obs;

  // unique index for each Checkbox
  List<bool> isChecked = [false, false, false, false, false].obs;

// Fetching List of Maps for Services List
  List<Map<String, dynamic>> fetchServicesListData() {
    return servicesListData.value =
        scheduleServicePageUseCase.callForServicesList();
  }

  /// Other Functionalities

  // Date picker
  Future selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2034));
    if (picked != null) {
      serviceDateController.value.text =
          DateFormat.yMMMEd().format(picked).toString();
    }
  }

  // Time picker
  Future selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      serviceTimeController.value.text = picked.format(context);
    }
  }
}
