import 'package:apk_islamic_questions/Pages/answer_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.filterString}) : super(key: key);
  final String filterString;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final CollectionReference _questions = FirebaseFirestore.instance.collection('Answers');
  String searchString = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(223, 204, 175, 100),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Center(
            child: TextField(
              onChanged: (String value) {
                setState(() {
                  searchString = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon (Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon (Icons.clear),
                  onPressed: () { print(widget.filterString);
                  },
                ),
                hintText: 'Pretraga...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
          stream: _questions.where("tagovi", arrayContains: widget.filterString).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];

                    if ((streamSnapshot.data!.docs[index].data().toString().toLowerCase().contains(searchString))) {
                      return Card(
                        margin: const EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
                        color: const Color.fromRGBO(81, 19, 1, 100),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              documentSnapshot['pitanje'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.robotoSlab(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              documentSnapshot['odgovor'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.vesperLibre(
                                fontSize: 11,
                              ),
                            ),
                          ),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AnswerPage(
                              pitanje: documentSnapshot['pitanje'],
                              odgovor: documentSnapshot['odgovor'],
                              osoba: documentSnapshot['osoba'],
                              datum: documentSnapshot['datum'].toDate(),
                              docID: documentSnapshot.id,
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
    );
  }
}