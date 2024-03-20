import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../landing_page/landing_page.dart';
import '../signup_page/signup_page.dart';

class EntryPointPage extends StatelessWidget {
  const EntryPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      key: key,
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        // if false then return AlertDialog Widget
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Do you want to EXIT ?'),
            actions: [
              OutlinedButton(
                onPressed: () async {
                  // if user click on Yes then,

                  Get.back();
                },
                child: const Text('Yes'),
              ),
              OutlinedButton(
                onPressed: () {
                  // if user click on No then,

                  // Just close the dialog
                  Get.back();
                },
                child: const Text('No'),
              ),
            ],
          ),
        );
      },
      child: StreamBuilder(
        // Firebase Auth Stream to detect in Realtime if a User Signed In or Not
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // if Signed In then show Landing Page
            return LandingPage();
          } else {
            // if not Signed In then show SignUp Page
            return SignUpPage();
          }
        },
      ),
    );
  }
}
