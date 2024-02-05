import 'package:bike_service_app/app/core/constants/theme/colors/colors.dart';
import 'package:get/get.dart';

SnackbarController snackbarWidget(String title, String message) {
  return Get.snackbar(
    title,
    message,
    backgroundColor: AppColors.backSheetColor,
    colorText: AppColors.frontSheetColor,
  );
}
