import 'package:bike_service_app/app/features/client_panel/schedule_summary/domain/entities/service_entity.dart';
import 'package:bike_service_app/app/features/client_panel/schedule_summary/domain/repositories/schedule_summary_repositories.dart';

class CreateServiceUseCase {
  final ScheduleSummaryRepository scheduleSummaryRepository;

  CreateServiceUseCase(this.scheduleSummaryRepository);

  // calling createService() method of ScheduleSummaryRepository abstract class while passing Instance/Object of ServiceEntity model class
  Future<void> call(ServiceEntity service) async {
    return await scheduleSummaryRepository.createService(service);
  }
}
