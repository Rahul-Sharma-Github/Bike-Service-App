import 'package:bike_service_app/app/core/constants/theme/colors/colors.dart';
import 'package:bike_service_app/app/core/constants/theme/textstyles/textstyle.dart';
import 'package:bike_service_app/app/core/firebase_api_instances/firebase_api_instances.dart';
import 'package:bike_service_app/app/global/widget_components/snackbar/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer_controller.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final DrawerControllerCommon drawerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // Header
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  isThreeLine: true,
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 36,
                    child: Icon(
                      Icons.person,
                      size: 36,
                    ),
                  ),
                  title: Text(drawerController.userName.value),
                  subtitle: Text(FirebaseApiInstances()
                          .authInstance
                          .value
                          .currentUser
                          ?.email ??
                      ''),
                ),
              ],
            ),
          ),
          // Tiles
          ListTile(
            title: const Text('Sign Out'),
            trailing: const Icon(Icons.logout),
            onTap: () async {
              try {
                await FirebaseApiInstances().authInstance.value.signOut();

                snackbarWidget('Account', 'You are Signed Out !',
                    AppColors.snackBarColorWarning);
              } catch (e) {
                debugPrint('Error while Signing Out in Drawer Widget = $e');
              }
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Delete Account'),
            trailing: const Icon(Icons.person_off_outlined),
            onTap: () async {
              // Confirming From user First, after that doing the Operation

              await Get.dialog(
                name: 'Confirm',
                AlertDialog(
                  title: const Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'All your data will be Lost !',
                              style: AppTextStyleTheme.alertDialogTitleText,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Do you Want to Delete your Account ?',
                              style: AppTextStyleTheme.descriptionText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  actions: [
                    // Yes
                    // Delete the Account
                    TextButton(
                      onPressed: () async {
                        try {
                          await FirebaseApiInstances()
                              .authInstance
                              .value
                              .currentUser
                              ?.delete();

                          snackbarWidget(
                              'Account',
                              'Your account has been deleted !',
                              AppColors.snackBarColorWarning);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'requires-recent-login') {
                            snackbarWidget(
                                'Alert',
                                'Please first Sign Out & then login Again !',
                                AppColors.snackBarColorWarning);

                            debugPrint(
                                'Please Login Again to do Delete Operation !');
                          }
                        } catch (e) {
                          debugPrint(
                              'Error while Deleting User Account in Drawer Widget = $e');
                        }
                      },
                      child: const Text('Yes'),
                    ),
                    // No
                    // Do Not delete the Account
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('No'),
                    ),
                  ],
                ),
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
