import 'package:apk_islamic_questions/Components/home_listview_builder.dart';
import 'package:apk_islamic_questions/Pages/answer_page_v2.dart';
import 'package:apk_islamic_questions/Pages/favorites_page.dart';
import 'package:apk_islamic_questions/Pages/search_page_v2.dart';
import 'package:apk_islamic_questions/Utilities/user_prefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_page.dart';

class HomePageV2 extends StatefulWidget {
  const HomePageV2({Key? key}) : super(key: key);

  @override
  State<HomePageV2> createState() => _HomePageV2State();
}

class _HomePageV2State extends State<HomePageV2> with TickerProviderStateMixin {
  List<String> lastAnswer = [];

  @override
  void initState(){
    super.initState();
    lastAnswer = UserPreferences.getLastAnswer() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> tabsList = <Tab>[
      const Tab(text: "Kur'an",),
      const Tab(text: "Namaz"),
      const Tab(text: "Post"),
      const Tab(text: "Zekat"),
      const Tab(text: "Hadž i Umra"),
      const Tab(text: "Bračno Pravo"),
      const Tab(text: "Nasljedno Pravo"),
      const Tab(text: "Liječenje Kur'anom"),
      const Tab(text: "Trgovina"),
      const Tab(text: "Islamsko Vjerovanje"),
      const Tab(text: "Hadis"),
      const Tab(text: "Ostalo"),
    ];

    final TabController tabController = TabController(length: tabsList.length, vsync: this);
    final CollectionReference _answers = FirebaseFirestore.instance.collection("Answers");



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
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 30,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => tabController.animateTo(0),
                  icon: Icon(
                    Icons.home_outlined,
                    size: 32,
                    color: Colors.grey.shade400,
                    semanticLabel: "Home",
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AuthPage())),
                  icon: Icon(
                    Icons.person,
                    size: 32,
                    color: Colors.grey.shade400,
                    semanticLabel: "Profile",
                  ),
                ),

              ],
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Početna",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        Icon(
                          Icons.home_outlined,
                          size: 32,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10,),

                  // TabBarView
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      controller: tabController,
                      tabs: tabsList,
                      indicatorWeight: 4,
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      indicatorPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                      indicatorColor: Colors.orangeAccent,
                      labelColor: Colors.orangeAccent,
                      unselectedLabelColor: Colors.grey.shade400,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      width: double.maxFinite,
                      height: 300,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Kur'an").orderBy("datum", descending: true).snapshots(),
                          ),
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Namaz").orderBy("datum", descending: true).snapshots(),
                          ),
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Post").orderBy("datum", descending: true).snapshots(),
                          ),
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Zekat").orderBy("datum", descending: true).snapshots(),
                          ),
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Hadž i Umra").orderBy("datum", descending: true).snapshots(),
                          ),
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Bračno Pravo").orderBy("datum", descending: true).snapshots(),
                          ),
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Nasljedno Pravo").orderBy("datum", descending: true).snapshots(),
                          ),
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Liječenje Kur'anom").orderBy("datum", descending: true).snapshots(),
                          ),
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Trgovina").orderBy("datum", descending: true).snapshots(),
                          ),
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Islamsko Vjerovanje").orderBy("datum", descending: true).snapshots(),
                          ),
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Hadis").orderBy("datum", descending: true).snapshots(),
                          ),
                          HomeListView(
                            currentStream: _answers.where("tagovi", arrayContains: "Ostalo").orderBy("datum", descending: true).snapshots(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        GlassmorphicContainer(
                          width: 5,
                          height: 25,
                          borderRadius: 20.0,
                          linearGradient: LinearGradient(
                            colors: [Colors.orange.shade200, Colors.orange.shade300],
                          ),
                          border: 1,
                          blur: 30,
                          borderGradient: LinearGradient(
                            colors: [Colors.orange.shade200, Colors.orange.shade300],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: GestureDetector(
                            onTap: () {Get.to(() => const SearchPageV2(
                            ),
                              transition: Transition.downToUp,
                              duration: const Duration(seconds: 1),
                            );
                            },
                            child: GlassmorphicContainer(
                              width: 340,
                              height: 50,
                              borderRadius: 10.0,
                              linearGradient: LinearGradient(
                                colors: [Colors.transparent.withOpacity(0.1), Colors.transparent.withOpacity(0.05)],
                              ),
                              border: 1,
                              blur: 30,
                              borderGradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Colors.orange.shade300, Colors.transparent],
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Text(
                                        "Tražilica ",style: GoogleFonts.robotoSlab(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.search_sharp, color: Colors.white,),
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

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        GlassmorphicContainer(
                          width: 5,
                          height: 25,
                          borderRadius: 20.0,
                          linearGradient: LinearGradient(
                            colors: [Colors.orange.shade200, Colors.orange.shade300],
                          ),
                          border: 1,
                          blur: 30,
                          borderGradient: LinearGradient(
                            colors: [Colors.orange.shade200, Colors.orange.shade300],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: GestureDetector(
                            onTap: () {Get.to(() => const FavoritesPage(
                            ),
                              transition: Transition.leftToRightWithFade,
                              duration: const Duration(seconds: 1),
                            );
                            },
                            child: GlassmorphicContainer(
                              width: 340,
                              height: 50,
                              borderRadius: 10.0,
                              linearGradient: LinearGradient(
                                colors: [Colors.transparent.withOpacity(0.1), Colors.transparent.withOpacity(0.05)],
                              ),
                              border: 1,
                              blur: 30,
                              borderGradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Colors.orange.shade300, Colors.transparent],
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Text(
                                        "Favoriti ",style: GoogleFonts.robotoSlab(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.favorite, color: Colors.white,),
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

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        GlassmorphicContainer(
                          width: 5,
                          height: 25,
                          borderRadius: 20.0,
                          linearGradient: LinearGradient(
                            colors: [Colors.orange.shade200, Colors.orange.shade300],
                          ),
                          border: 1,
                          blur: 30,
                          borderGradient: LinearGradient(
                            colors: [Colors.orange.shade200, Colors.orange.shade300],
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              lastAnswer = UserPreferences.getLastAnswer()!;

                              if(lastAnswer.isNotEmpty) {
                                Get.to(() => AnswerDetailsPage(
                                  docID: lastAnswer[1].toString(),
                                  odgovor: lastAnswer[2].toString(),
                                  osoba: lastAnswer[3].toString(),
                                  pitanje: lastAnswer[1].toString(),
                                ),
                                  transition: Transition.leftToRightWithFade,
                                  duration: const Duration(seconds: 1),
                                );
                              }

                            },
                            child: GlassmorphicContainer(
                              width: 340,
                              height: 50,
                              borderRadius: 10.0,
                              linearGradient: LinearGradient(
                                colors: [Colors.transparent.withOpacity(0.1), Colors.transparent.withOpacity(0.05)],
                              ),
                              border: 1,
                              blur: 30,
                              borderGradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [Colors.orange.shade300, Colors.transparent],
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: Text(
                                        "Zadnje čitano ",style: GoogleFonts.robotoSlab(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                      ),
                                    ),

                                    const Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Icon(Icons.bookmark, color: Colors.white,),
                                    ),
                                  ],
                                ),
                              ),

                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
