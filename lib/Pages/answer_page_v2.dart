import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utilities/user_prefs.dart';

class AnswerDetailsPage extends StatefulWidget {

  final String docID;
  final String pitanje;
  final String odgovor;
  final String osoba;
  final DateTime? datum;

  const AnswerDetailsPage({Key? key, required this.docID, required this.pitanje, required this.odgovor, required this.osoba, this.datum}) : super(key: key);

  @override
  State<AnswerDetailsPage> createState() => _AnswerDetailsPageState();
}

class _AnswerDetailsPageState extends State<AnswerDetailsPage> {

  List<String> favoritesList = [];
  List<String> lastAnswer = [];

  @override
  void initState() {
    super.initState();
    favoritesList = UserPreferences.getFavorites() ?? [];
    lastAnswer = [widget.docID, widget.pitanje, widget.odgovor, widget.osoba];
    UserPreferences.setLastAnswer(lastAnswer);
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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
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

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () async {
                            setState(() {
                              if(favoritesList.contains(widget.docID)){
                                favoritesList.remove(widget.docID);
                              } else {
                                favoritesList.add(widget.docID);
                              }
                            });
                            await UserPreferences.setFavorites(favoritesList);
                          },
                          icon: Icon(
                            favoritesList.contains(widget.docID) ? Icons.favorite : Icons.favorite_outline,
                            color: Colors.white,
                            size: 30,
                          )
                      ),
                    ),
                  ],
                ),

                Center(
                  child: GlassmorphicContainer(
                    height: 700,
                    width: 350,
                    borderRadius: 20.0,
                    margin: const EdgeInsets.only(top: 20),
                    linearGradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [const Color(0xFF06010f).withOpacity(0.7), const Color(0xFF06010f).withOpacity(0.2), const Color(0xFF06010f).withOpacity(0.5)],
                    ),
                    border: 3,
                    blur: 20,
                    borderGradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.orange.shade200, Colors.transparent],
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                            child: Text(
                              widget.pitanje,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.robotoSlab(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                              child: Text(
                                widget.osoba,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.poppins(
                                  color: Colors.orangeAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: widget.odgovor,
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 15,
                                    letterSpacing: 1,
                                  ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
