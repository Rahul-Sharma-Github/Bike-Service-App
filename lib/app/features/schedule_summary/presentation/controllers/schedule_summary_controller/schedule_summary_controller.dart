import 'package:get/get.dart';

class ScheduleSummaryController extends GetxController {
  // variable to store Total price of all selected services
  var price = 0.obs;

  var totalPrice = 0.obs;

  int totalPriceResult(List<dynamic>? selectedServiceList) {
    price.value = 0;
    totalPrice.value = 0;
    for (var element in selectedServiceList!) {
      price.value = (price.value + element['price']).toInt();
    }
    return totalPrice.value = price.value;
  }
}
