import 'package:apk_islamic_questions/Pages/answer_page_v2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Pages/answer_page.dart';

class HomeListView extends StatefulWidget {
  const HomeListView({Key? key, required this.currentStream}) : super(key: key);
  final Stream<dynamic>? currentStream;

  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.currentStream,
      builder: (context, AsyncSnapshot<dynamic> streamSnapshot) {

        if (streamSnapshot.hasData) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => AnswerDetailsPage(
                      docID: documentSnapshot.id,
                      pitanje: documentSnapshot["pitanje"],
                      odgovor: documentSnapshot["odgovor"],
                      datum: documentSnapshot["datum"].toDate(),
                      osoba: documentSnapshot["osoba"],
                    ),
                      transition: Transition.leftToRight,
                      duration: const Duration(seconds: 1),
                    );
                  },
                  child: GlassmorphicContainer(
                    height: 300,
                    width: 300,
                    margin: const EdgeInsets.only(right: 15.0),
                    borderRadius: 20.0,
                    linearGradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [const Color(0xFF063970).withOpacity(0.5), const Color(0xFF06010f).withOpacity(0.7)],
                    ),
                    border: 2,
                    blur: 20,
                    borderGradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.orange.shade200, Colors.transparent],
                    ),
                    child: Theme(
                      data: ThemeData(
                        splashFactory: NoSplash.splashFactory,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: SizedBox(
                        height: 300,
                        child: ListTile(
                            title: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 15.0),
                              child: Text(
                                documentSnapshot['pitanje'],
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.robotoSlab(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                              child: Text(
                                documentSnapshot['odgovor'],
                                maxLines: 10,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.vesperLibre(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                        ),
                      ),
                    ),
                  ),
                );
              }
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
