// Material package for Material Design Components
import 'package:flutter/material.dart';

// External Packages

// Device Preview Package
import 'package:device_preview/device_preview.dart';

// GetX Package
import 'package:get/get.dart';

// Firebase Core + Firebase_Options Packages
import 'package:firebase_core/firebase_core.dart';
import 'package:bike_service_app/firebase_options.dart';

// Firebase Auth Package
import 'package:firebase_auth/firebase_auth.dart';

// Page Imports

// Entry Point of App
Future<void> main() async {
  // it will initialize our Flutter Firebase app before starting the App
  WidgetsFlutterBinding.ensureInitialized();
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
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),

      // First Page to show on screen
      home: const SignUp(),
    );
  }
}

// Demo of SignUp Page
class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Center(
        child: Text('SignUp Page'),
      ),
    );
  }
}
