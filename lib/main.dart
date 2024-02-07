// Material package for Material Design Components
import 'package:bike_service_app/app/core/app_bindings/app_bindings.dart';
import 'package:bike_service_app/app/features/authentication/presentation/pages/signup_page/signup_page.dart';
import 'package:flutter/material.dart';

//// External Packages

// Device Preview Package
import 'package:device_preview/device_preview.dart';

// GetX Package
import 'package:get/get.dart';

//// Firebase Packages

// Firebase Core + Firebase_Options Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:bike_service_app/firebase_options.dart';

// Firebase Auth Package
import 'package:firebase_auth/firebase_auth.dart';

// Firebase Firestore Package
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'app/features/authentication/presentation/pages/landing_page/landing_page.dart';

//// Page Imports

// Entry Point of App
Future<void> main() async {
  // it will initialize our Flutter Firebase app before starting the App
  WidgetsFlutterBinding.ensureInitialized();
  // Initilizing Firebase API
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // Device Preview Settings
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // GetMaterialApp to access all GetX functionality in our App
    return GetMaterialApp(
      // changing app's settings, so Device Preview can run properly
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      // Disabled the Debug Banner
      debugShowCheckedModeBanner: false,

      title: 'Ganpati Motor Services',
      theme: ThemeData(
        // Material 3 Support Enabled
        useMaterial3: true,
      ),

      // App Bindings initialization
      initialBinding: AppBindings(),

      // First Page to show on screen
      home: StreamBuilder(
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
