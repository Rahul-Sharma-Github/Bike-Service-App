import 'package:bike_service_app/app/features/services/domain/repositories/service_page_repositories/service_page_repository.dart';

class ServicePageUseCase {
  final ServicePageRepository servicePageRepository;

  ServicePageUseCase(this.servicePageRepository);

  List<Map<String, dynamic>> call() {
    return servicePageRepository.serviceList();
  }
}
