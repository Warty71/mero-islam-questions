import 'package:apk_islamic_questions/Utilities/user_prefs.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Question.dart';

Future createQuestion({
  required String question,required String user, required DateTime date,
}) async {
  final docQuestion = FirebaseFirestore.instance.collection("Questions").doc();

  final pitanje = Question(
    question : question,
    date: date,
    user: user,
  );

  final json = pitanje.toJson();
  await docQuestion.set(json);
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key,);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final user = FirebaseAuth.instance.currentUser!;
  final controllerQuestion = TextEditingController();
  final today = DateTime.now();
  late DateTime askDate;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    askDate = DateTime.parse(UserPreferences.getAskedDate() ?? "1944-06-06 02:00:00.000");
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
      child:Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GlassmorphicContainer(
                    width: double.maxFinite,
                    height: 250,
                    borderRadius: 20.0,
                    linearGradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [const Color(0xFF063970).withOpacity(0.5), const Color(0xFF06010f).withOpacity(0.7)],
                    ),
                    border: 1,
                    blur: 10,
                    borderGradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.orange.shade200, Colors.transparent],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Theme(
                                data: ThemeData(
                                  highlightColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                ),
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

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Theme(
                                data: ThemeData(
                                  highlightColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                ),
                                child: IconButton(
                                  onPressed: () {signUserOut();},
                                  icon: const Icon(
                                    Icons.logout,
                                    size: 30,
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          backgroundImage: AssetImage("lib/Pictures/Picture 1.jpg"),
                          radius: 50,
                        ),

                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              user.email!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "Imaš pitanje?",
                    style: GoogleFonts.robotoSlab(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                  child: TextFormField(
                    maxLines: 5,
                    controller: controllerQuestion,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(width: 2, color: Colors.orange.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(width: 2, color: Colors.orange.shade200),
                      ),
                      hintText: 'Postavi nam pitanje...',
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        fixedSize: const Size(150, 60),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      onPressed: () async {
                        setState(() {
                          if (askDate.second != today.second) {
                            final json = Question(
                              question: controllerQuestion.text,
                              user: user.email!,
                              date: DateTime.now(),
                            );

                            createQuestion(
                              question: json.question,
                              user: json.user,
                              date: json.date,
                            );
                            controllerQuestion.clear();
                            askDate = today;

                            final snackBar = SnackBar(
                              content: AwesomeSnackbarContent(
                                title: "Poslano!",
                                message: "Hvala vam na pitanju.",
                                contentType: ContentType.success,
                              ),
                              elevation: 0,
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }else if (askDate.second == today.second){
                            controllerQuestion.clear();

                            final snackBar = SnackBar(
                              content: AwesomeSnackbarContent(
                                title: "Žao nam je...",
                                message: "Danas ste već postavili pitanje. ",
                                contentType: ContentType.failure,
                              ),
                              elevation: 0,
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        });
                        await UserPreferences.setAskedDate(askDate.toString());
                      },

                      child: const Text("Pošalji"),

                    ),
                  ),

              ],
            ),
          )
      ),
    );
  }
}