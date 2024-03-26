// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:bike_service_app/app/global/widget_components/app_bar/appbar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/theme/colors/colors.dart';

class DashboardHomePage extends StatelessWidget {
  const DashboardHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backSheetColor,
      appBar: appBar('Dashboard'),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)),
          color: AppColors.frontSheetColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //
              //
              // Manage Section
              const Text(
                'Manage',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20.0),
              Flexible(
                fit: FlexFit.loose,
                child: GridView.count(
                  childAspectRatio: 0.7,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  crossAxisCount: 2,
                  children: [
                    // card = 1 [Scheduled Services]
                    Card(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Scheduled Service',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 1.0,
                                indent: 10.0,
                                endIndent: 10.0,
                              ),
                              Expanded(
                                  child: Container(
                                child: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          'Today',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '4',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 32.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // card = 2 [Registered Customer]
                    Card(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Scheduled Service',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 1.0,
                                indent: 10.0,
                                endIndent: 10.0,
                              ),
                              Expanded(
                                  child: Container(
                                child: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          'Total',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '70',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 32.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              //
              //
              // Analysis Section
              const Text(
                'Analysis',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20.0),
              Flexible(
                fit: FlexFit.loose,
                child: GridView.count(
                  childAspectRatio: 0.7,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  crossAxisCount: 2,
                  children: [
                    // card = 1 [Services Analysis]
                    Card(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Services Done',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 1.0,
                                indent: 10.0,
                                endIndent: 10.0,
                              ),
                              Expanded(
                                  child: Container(
                                child: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          'Today',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '3',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 32.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // card = 2 [New Registered Customer Analysis]
                    Card(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'New Registered',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 1.0,
                                indent: 10.0,
                                endIndent: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'This Month',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            '16',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // card = 3 [Payments Recieved Analysis]
                    Card(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Container(
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Payment Recieved',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 1.0,
                                indent: 10.0,
                                endIndent: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'Today',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            '3200',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 32.0,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
