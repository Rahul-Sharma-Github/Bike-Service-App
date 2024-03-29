// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDbVER0Mcv7iD-STcznicbGkfbVUQj5I4Y',
    appId: '1:718544360707:web:6a0cdb7925c1c138dec536',
    messagingSenderId: '718544360707',
    projectId: 'bike-service-app-b0c4d',
    authDomain: 'bike-service-app-b0c4d.firebaseapp.com',
    storageBucket: 'bike-service-app-b0c4d.appspot.com',
    measurementId: 'G-V0DZVFYNRV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASfP9flD4A6jyHdZsV3QW0G3ANUYx6-9o',
    appId: '1:718544360707:android:86fbd83933512198dec536',
    messagingSenderId: '718544360707',
    projectId: 'bike-service-app-b0c4d',
    storageBucket: 'bike-service-app-b0c4d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCt65YzQavCdVPU0GNcQaEiX1YDmkQDxFk',
    appId: '1:718544360707:ios:07889ad535039b6cdec536',
    messagingSenderId: '718544360707',
    projectId: 'bike-service-app-b0c4d',
    storageBucket: 'bike-service-app-b0c4d.appspot.com',
    iosBundleId: 'com.example.bikeServiceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCt65YzQavCdVPU0GNcQaEiX1YDmkQDxFk',
    appId: '1:718544360707:ios:5f9ac12cccc53fa2dec536',
    messagingSenderId: '718544360707',
    projectId: 'bike-service-app-b0c4d',
    storageBucket: 'bike-service-app-b0c4d.appspot.com',
    iosBundleId: 'com.example.bikeServiceApp.RunnerTests',
  );
}
