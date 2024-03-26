import 'package:bike_service_app/app/features/client_panel/my_services/domain/use_cases/my_services_use_case.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MyServicesController extends GetxController {
  final MyServicesUseCase myServicesUseCase;

  MyServicesController(this.myServicesUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchStreamData();
  }

  // variable to store Stream
  // Rx<Stream<QuerySnapshot<Map<String, dynamic>>>?> streamData =
  //     Rx<Stream<QuerySnapshot<Map<String, dynamic>>>?>(null);

  // method to fetch stream
  Stream<QuerySnapshot<Map<String, dynamic>>?> fetchStreamData() {
    return myServicesUseCase.callForStream();
  }
}
