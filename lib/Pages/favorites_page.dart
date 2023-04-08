import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Utilities/user_prefs.dart';
import 'answer_page_v2.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final CollectionReference _answers = FirebaseFirestore.instance.collection('Answers');
  List<String> favorites = [];

  @override
  void initState() {
    super.initState();
    favorites = UserPreferences.getFavorites() ?? [];
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
              const SizedBox(
                height: 10,
              ),
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
                ],
              ),

              Center(
                child: GlassmorphicContainer(
                  height: 680,
                  width: 350,
                  borderRadius: 20.0,
                  margin: const EdgeInsets.only(top: 20),
                  linearGradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [const Color(0xFF06010f).withOpacity(0.2), const Color(0xFF06010f).withOpacity(0.5)],
                  ),
                  border: 3,
                  blur: 20,
                  borderGradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.orange.shade200, Colors.transparent],
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: StreamBuilder(
                                stream: _answers.snapshots(),
                                builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                                  if (streamSnapshot.hasData) {
                                    return ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: streamSnapshot.data!.docs.length,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context, int index) {
                                          DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];

                                          if (favorites.contains(documentSnapshot.id)) {
                                            return GestureDetector(
                                              onTap: () =>  Navigator.of(context).push(MaterialPageRoute(builder: (_) => AnswerDetailsPage(
                                                docID: documentSnapshot.id,
                                                pitanje: documentSnapshot["pitanje"],
                                                odgovor: documentSnapshot["odgovor"],
                                                datum: documentSnapshot["datum"].toDate(),
                                                osoba: documentSnapshot["osoba"],
                                              ),)),
                                              child: GlassmorphicContainer(
                                                margin: const EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
                                                width: double.maxFinite,
                                                height: 130,
                                                borderRadius: 20.0,
                                                linearGradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  colors: [const Color(0xFF06010f).withOpacity(0.7), const Color(0xFF06010f).withOpacity(0.2), const Color(0xFF06010f).withOpacity(0.5)],
                                                ),
                                                border: 2,
                                                blur: 30,
                                                borderGradient: LinearGradient(
                                                  begin: Alignment.topRight,
                                                  end: Alignment.bottomLeft,
                                                  colors: [Colors.orange.shade200, Colors.orange.shade200.withOpacity(0.2)],
                                                ),
                                                child: ListTile(
                                                  title: Padding(
                                                    padding: const EdgeInsets.only(top: 8.0),
                                                    child: Text(
                                                      documentSnapshot['pitanje'],
                                                      maxLines: 3,
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.center,
                                                      style: GoogleFonts.robotoSlab(
                                                        fontSize: 14,
                                                        color: Colors.orangeAccent,
                                                      ),
                                                    ),
                                                  ),
                                                  subtitle: Padding(
                                                    padding: const EdgeInsets.only(top: 8.0),
                                                    child: Text(
                                                      documentSnapshot['odgovor'],
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.center,
                                                      style: GoogleFonts.vesperLibre(
                                                        fontSize: 11,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          else {
                                            return const Visibility(
                                              visible: false,
                                              child: Text(
                                                'no match',
                                                style: TextStyle(fontSize: 4.0),
                                              ),
                                            );
                                          }
                                        }
                                    );
                                  }
                                  return const CircularProgressIndicator();
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
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