import 'package:bike_service_app/app/features/services/domain/use_cases/service_page_usecase/service_page_usecase.dart';
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

  // Other Functionalities for ServicesPage

  // variable to open / close the BottomSheet
  var isOpen = false.obs;

  // variable to change current selected card's index
  var currentIndex = 0.obs;

  void bottomSheetShowClose(int index) {
    if (!isOpen.value) {
      currentIndex.value = index;
      isOpen.value = true;
    } else {
      isOpen.value = false;
    }
  }
}
