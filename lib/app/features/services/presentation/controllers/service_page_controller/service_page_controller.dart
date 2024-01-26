import 'package:bike_service_app/app/features/services/domain/use_cases/service_page_usecase/service_page_usecase.dart';
import 'package:get/get.dart';

class ServicePageController extends GetxController {
  final ServicePageUseCase servicePageUseCase;

  ServicePageController(this.servicePageUseCase);

  // List of Maps
  var serviceListData = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // Fetching Data
  List<Map<String, dynamic>> fetchData() {
    return serviceListData.value = servicePageUseCase.call();
  }
}
