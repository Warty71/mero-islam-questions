import 'package:apk_islamic_questions/Pages/answer_page_v2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPageV2 extends StatefulWidget {
  const SearchPageV2({Key? key}) : super(key: key);

  @override
  State<SearchPageV2> createState() => _SearchPageV2State();
}

class _SearchPageV2State extends State<SearchPageV2> {

  final CollectionReference _answers = FirebaseFirestore.instance.collection('Answers');
  String searchString = '';

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
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                child: TextFormField(

                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  onChanged: (String value) {
                    setState(() {
                      searchString = value.toLowerCase();
                    });
                  },
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
                    prefixIcon: const Icon (Icons.search, color: Colors.white,),
                    hintText: 'Unesi tekst za pretragu...',
                    border: InputBorder.none,
                  ),
                ),
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
                                  if (streamSnapshot.hasData && (searchString.length >= 3)) {
                                    return ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: streamSnapshot.data!.docs.length,
                                        shrinkWrap: true,
                                        itemBuilder: (BuildContext context, int index) {
                                          DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];

                                          if ((streamSnapshot.data!.docs[index].data().toString().toLowerCase().contains(searchString)) && ((searchString.length >= 3))) {
                                            return GestureDetector(
                                              onTap: () {
                                                Get.to(() => AnswerDetailsPage(
                                                  docID: documentSnapshot.id,
                                                  pitanje: documentSnapshot["pitanje"],
                                                  odgovor: documentSnapshot["odgovor"],
                                                  datum: documentSnapshot["datum"].toDate(),
                                                  osoba: documentSnapshot["osoba"],
                                                ),
                                                  transition: Transition.rightToLeft,
                                                  //popGesture: true,
                                                  duration: const Duration(seconds: 1),
                                                );
                                              },
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
                                  return const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(
                                        "Traži i nauči!",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  );
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
