import 'package:apk_islamic_questions/Pages/profile_page.dart';
import 'package:apk_islamic_questions/Pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'email_verification_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }
          else if (snapshot.hasError) {
            return const Center(child: Text('Error!'));
          }
          else if (snapshot.hasData) {
            return const VerifyEmailPage();
          }
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}