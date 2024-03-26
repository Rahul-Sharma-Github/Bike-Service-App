import 'package:bike_service_app/app/features/client_panel/services/domain/repositories/service_page_repositories/service_page_repository.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/constants/assets_path/asset_path.dart';

class ServicePageRepoImpl implements ServicePageRepository {
  @override
  List<Map<String, dynamic>> serviceList() {
    try {
      return [
        {
          "image": AssetPaths.regularTuneUp,
          "name": "Regular Tune-Up",
          "description":
              "Keep your bike performing at its best with our regular tune-up service. We check and adjust essential components, including brakes, gears, and tire pressure."
        },
        {
          "image": AssetPaths.oilAndLubrication,
          "name": "Oil and Lubrication",
          "description":
              "Ensure optimal performance and longevity with our professional oil and lubrication services. We use high-quality products to keep your bike running smoothly."
        },
        {
          "image": AssetPaths.brakeInspectionAndAdjustment,
          "name": "Brake Inspection and Adjustment",
          "description":
              "Safety is our priority. Our experts meticulously inspect and adjust your bike's brakes to guarantee reliable stopping power."
        },
        {
          "image": AssetPaths.chainMaintenance,
          "name": "Chain Maintenance",
          "description":
              "A well-maintained chain is crucial for a smooth ride. We clean, lubricate, and adjust your bike's chain for optimal efficiency."
        },
        {
          "image": AssetPaths.wheelAlignment,
          "name": "Wheel Alignment",
          "description":
              "Improve handling and stability with our precise wheel alignment services. We make sure your wheels are perfectly aligned for a safer ride."
        }
      ];
    } catch (e) {
      debugPrint('Error in ServicePageRepoImpl = $e');
    }
    throw UnimplementedError(
        'Error in ServicePageRepoImpl class for serviceList()');
  }

  @override
  List<Map<String, dynamic>> customerTestimonialList() {
    try {
      return [
        {
          "name": "Rajesh Kumar",
          "city": "Beawar, Rajasthan",
          "description":
              "Incredible bike service experience! Quick turnaround, fair pricing, and my bike runs like new. Highly recommend these guys for hassle-free maintenance."
        },
        {
          "name": "Ananya Singh",
          "city": "Beawar, Rajasthan",
          "description":
              "The team here knows bikes inside out! Professional service, genuine advice, and my ride feels smoother than ever. No more worries about maintenance headaches."
        },
        {
          "name": "Vikas Sahu",
          "city": "Beawar, Rajasthan",
          "description":
              "After service, there are no problems left in my bike. Excellent Service !"
        }
      ];
    } catch (e) {
      debugPrint(
          'Error in ServicePageRepoImpl class for customerTestimonialList() = $e');
    }

    throw UnimplementedError(
        'Error in ServicePageRepoImpl class for customerTestimonialList()');
  }
}
