import 'package:apk_islamic_questions/Components/login_signIn_button.dart';
import 'package:apk_islamic_questions/Components/login_square_tile.dart';
import 'package:apk_islamic_questions/Components/login_textfield.dart';
import 'package:apk_islamic_questions/Pages/forgot_pw_page.dart';
import 'package:apk_islamic_questions/Pages/register_page.dart';
import 'package:apk_islamic_questions/Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key,}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Sign the user in - method
  Future signUserIn() async{

    //Show dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
      const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //Try to sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on Exception catch (e) {
      print(e);
    }

    //Pop the loading circle
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    Navigator.of(navigatorKey.currentContext!,rootNavigator: true).pop();
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
                      Icons.lock,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),

                  // Welcome back
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Ehlen ve sehlen!!',
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
                    obscureText: true,
                    controller: passwordController,
                  ),

                  // Forgot password?
                   Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0, bottom: 15, top: 10.0),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ForgotPasswordPage())),
                        child: Text('Zaboravili ste šifru?',
                          style: TextStyle(color: Colors.orange.shade200, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  // Sign in button
                  LoginSignInButton(
                      onTap: signUserIn
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
                            'Možete se prijaviti koristeći',
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
                    ],
                  ),

                  // Register now
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Nemate račun? ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RegisterPage())),
                          child: Text('Registrujte se!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade200,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
