import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../landing_page/landing_page.dart';
import '../signup_page/signup_page.dart';

class EntryPointPage extends StatelessWidget {
  const EntryPointPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
    );
  }
}
