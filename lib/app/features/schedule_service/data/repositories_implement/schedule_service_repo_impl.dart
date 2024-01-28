import 'package:bike_service_app/app/features/schedule_service/domain/repositories/schedule_service_repositories.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/assets_path/asset_path.dart';

class ScheduleServiceRepoImpl implements ScheduleServiceRepositories {
  @override
  List<Map<String, dynamic>> servicesList() {
    try {
      return [
        {
          "image": AssetPaths.regularTuneUp,
          "name": "Regular Tune-Up",
          "price": 150
        },
        {
          "image": AssetPaths.oilAndLubrication,
          "name": "Oil and Lubrication",
          "price": 250
        },
        {
          "image": AssetPaths.brakeInspectionAndAdjustment,
          "name": "Brake Inspection and Adjustment",
          "price": 180
        },
        {
          "image": AssetPaths.chainMaintenance,
          "name": "Chain Maintenance",
          "price": 120
        },
        {
          "image": AssetPaths.wheelAlignment,
          "name": "Wheel Alignment",
          "price": 350
        }
      ];
    } catch (e) {
      debugPrint('Error in ScheduleServiceRepoImpl = $e');
    }
    throw UnimplementedError(
        'Error in ScheduleServiceRepoImpl class for servicesList()');
  }
}
