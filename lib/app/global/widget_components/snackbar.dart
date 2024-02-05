import 'package:bike_service_app/app/core/constants/theme/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController snackbarWidget(String title, String message, Color bgColor) {
  return Get.snackbar(
    title,
    message,
    backgroundColor: bgColor,
    colorText: AppColors.frontSheetColor,
  );
}
