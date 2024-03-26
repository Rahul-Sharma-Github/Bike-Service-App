import 'package:bike_service_app/app/features/client_panel/services/domain/repositories/service_page_repositories/service_page_repository.dart';

class ServicePageUseCase {
  final ServicePageRepository servicePageRepository;

  ServicePageUseCase(this.servicePageRepository);

  List<Map<String, dynamic>> callForServiceList() {
    return servicePageRepository.serviceList();
  }

  List<Map<String, dynamic>> callForCustomerTestimonialList() {
    return servicePageRepository.customerTestimonialList();
  }
}
