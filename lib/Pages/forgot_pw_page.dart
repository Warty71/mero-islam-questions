import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Components/login_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text("Link za reset šifre poslan na e-mail!"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
    }

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
                          onPressed: () {Navigator.pop(context);},
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
                        Icons.lock_reset,
                        size: 100,
                        color: Colors.white,
                      ),
                    ),

                    // Welcome back
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Unesite e-mail',
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

                    const SizedBox(height: 15,),

                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            fixedSize: const Size(150, 60),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )
                        ), onPressed: () {
                          passwordReset();
                      },
                        child: const Text ("Pošalji"),
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
