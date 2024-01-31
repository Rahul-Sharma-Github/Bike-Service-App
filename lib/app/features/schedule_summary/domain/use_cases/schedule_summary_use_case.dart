import 'package:bike_service_app/app/features/schedule_summary/domain/entities/service_entity.dart';
import 'package:bike_service_app/app/features/schedule_summary/domain/repositories/schedule_summary_repositories.dart';

class CreateServiceUseCase {
  final ScheduleSummaryRepository scheduleSummaryRepository;

  CreateServiceUseCase(this.scheduleSummaryRepository);

  Future<void> call(ServiceEntity service) async {
    return await scheduleSummaryRepository.createService(service);
  }
}
