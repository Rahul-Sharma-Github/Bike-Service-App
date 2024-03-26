import 'package:bike_service_app/app/features/client_panel/schedule_summary/domain/entities/service_entity.dart';

abstract class ScheduleSummaryRepository {
  Future<void> createService(ServiceEntity service);
}
