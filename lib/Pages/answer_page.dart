import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utilities/user_prefs.dart';


class AnswerPage extends StatefulWidget {

  final String docID;
  final String pitanje;
  final String odgovor;
  final String osoba;
  final DateTime datum;

  const AnswerPage({super.key, required this.docID, required this.pitanje, required this.odgovor, required this.datum, required this.osoba});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AnswerPage> {

  List<String> favoritesList = [];

  @override
  void initState() {
    super.initState();
    favoritesList = UserPreferences.getFavorites() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final alreadyAdded = favoritesList.contains(widget.docID);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
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
              )
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                widget.pitanje,
                style: GoogleFonts.robotoSlab(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
              ),

              const SizedBox(
                height: 50,
              ),


              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.odgovor,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 16,
                  ),
                ),
              ),


              const SizedBox(
                height: 50,
              ),


              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  widget.osoba,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 13,
                  ),
                ),
              ),


              const SizedBox(
                height: 15,
              ),


              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  widget.datum.toString(),
                  style: GoogleFonts.robotoSlab(
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
