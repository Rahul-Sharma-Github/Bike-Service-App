import 'package:bike_service_app/app/core/constants/theme/colors/colors.dart';
import 'package:bike_service_app/app/core/firebase_api_instances/firebase_api_instances.dart';
import 'package:bike_service_app/app/global/widget_components/snackbar/snackbar.dart';
import 'package:flutter/material.dart';

Widget drawerWidget() {
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
                title: const Text('User Name'),
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
          onTap: () {},
        ),
        const Divider(),
      ],
    ),
  );
}
