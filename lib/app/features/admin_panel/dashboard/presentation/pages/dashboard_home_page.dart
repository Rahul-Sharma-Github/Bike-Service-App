import 'package:bike_service_app/app/global/widget_components/app_bar/appbar.dart';
import 'package:flutter/material.dart';

class DashboardHomePage extends StatelessWidget {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Dashboard'),
      body: const Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
