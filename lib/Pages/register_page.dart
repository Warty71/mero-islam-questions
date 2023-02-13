import 'package:apk_islamic_questions/Components/register_registerNow_button.dart';
import 'package:apk_islamic_questions/Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/login_square_tile.dart';
import '../Components/login_textfield.dart';
import '../main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key,}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  //Sign the user in - method
  Future signUserUp() async {
    //Show dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
      const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //Try to sign up. I need to add an error MSG in case the passwords don't match
    if (passwordController.text == confirmController.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } on Exception catch (e) {
        print(e);
      }
    }

    //Pop the loading circle
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF063970), Color(0xFF1a335e), Color(0xFF06010f)],
          stops: [0.3, 0.6, 1],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Center(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {Get.back();},
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Logo
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Icon(
                      Icons.app_registration,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),


                  // Welcome back
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Napravi novi račun',
                      style: GoogleFonts.robotoSlab(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Username
                  LoginTextField(
                    hintText: 'E-mail',
                    obscureText: false,
                    controller: emailController,
                  ),

                  // Password
                  LoginTextField(
                    hintText: 'Šifra',
                    obscureText: false,
                    controller: passwordController,
                  ),

                  //Confirm Password
                  LoginTextField(
                    hintText: 'Potvrdi šifru',
                    obscureText: false,
                    controller: confirmController,
                  ),

                  const SizedBox(height: 10),

                  // Register button
                  RegisterNowButton(
                      onTap: signUserUp
                  ),

                  // Continue with
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.orange.shade200,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Možete se registrovati koristeći',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.orange.shade200,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Social media login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                        imagePath: 'lib/Icons/google.png',
                        onTap: () => AuthService().signInWithGoogle(),
                      ),

                      SquareTile(
                        imagePath: 'lib/Icons/apple.png',
                        onTap: () {  },
                      ),

                      SquareTile(
                        imagePath: 'lib/Icons/facebook.png',
                        onTap: () {  },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}