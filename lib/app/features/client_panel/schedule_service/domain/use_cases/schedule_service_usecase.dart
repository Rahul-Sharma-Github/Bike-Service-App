import 'package:bike_service_app/app/features/client_panel/schedule_service/domain/repositories/schedule_service_repositories.dart';

class ScheduleServicePageUseCase {
  final ScheduleServiceRepositories scheduleServiceRepositories;

  ScheduleServicePageUseCase(this.scheduleServiceRepositories);

  List<Map<String, dynamic>> callForServicesList() {
    return scheduleServiceRepositories.servicesList();
  }
}
