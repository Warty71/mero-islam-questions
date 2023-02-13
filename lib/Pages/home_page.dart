import 'package:apk_islamic_questions/Pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    //colors: [Colors.teal, Colors.purple],
                    colors: [Colors.grey.shade900, Colors.brown.shade200],
                  )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Učvrsti svoje srce!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.bebasNeue(
                            fontSize: 56,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Text(
                      "Izaberi temu koja te zanima!",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10.0),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 4,
                          mainAxisCellCount: 1,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Kur'an",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(171, 116, 79, 100), Color.fromRGBO(161, 89, 30, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Kur'an",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontSize: 38,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Namaz",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(150, 63, 25, 100), Color.fromRGBO(150, 63, 25, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Namaz",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.oswald(
                                        color: Colors.white,
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Post",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(156, 85, 54, 100), Color.fromRGBO(156, 85, 54, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Post",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.sanchez(
                                        color: Colors.white,
                                        fontSize: 34,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Zekat",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(183, 84, 45, 100), Color.fromRGBO(200, 84, 45, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Zekat",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Hadž i Umra",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(49, 51, 50, 100), Color.fromRGBO(49, 51, 50, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Hadž i Umra",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Bračno Pravo",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(170, 170, 170, 100), Color.fromRGBO(170, 170, 170, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Bračno Pravo",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Nasljedno Pravo",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(150, 63, 25, 100), Color.fromRGBO(150, 63, 25, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Nasljedno Pravo",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Trgovina",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(191, 57, 11, 100), Color.fromRGBO(191, 57, 11, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Trgovina",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.oswald(
                                        color: Colors.white,
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Liječenje Kur'anom",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(144, 46, 21, 100), Color.fromRGBO(144, 46, 21, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Liječenje Kur'anom",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.sanchez(
                                        color: Colors.white,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 4,
                          mainAxisCellCount: 1,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Islamsko Vjerovanje",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(81, 19, 1, 100), Color.fromRGBO(81, 19, 1, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Islamsko Vjerovanje",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.raleway(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 2,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Hadis",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(180, 163, 137, 100), Color.fromRGBO(180, 163, 137, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Hadis",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.oswald(
                                        color: Colors.white,
                                        fontSize: 35,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1,
                          child: Card(
                            child: Material(
                              color: Colors.white.withOpacity(0.0),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "Ostalo",))),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Color.fromRGBO(49, 51, 50, 100), Color.fromRGBO(39, 51, 50, 100)],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Ostalo",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.sanchez(
                                        color: Colors.white,
                                        fontSize: 26,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25.0),

                  Center(
                    child: Text(
                      "Nisi pronašao što tražiš? Pretraži sva pitanja tražilicom u gornjem desnom uglu!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25.0),


                  /*const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Pretraži odabrana pitanja...',
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange, width: 2.0,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange, width: 2.0,
                            )
                        ),
                      ),
                    ),
                  ),*/


                  /*const SizedBox(height: 25),


                  Expanded(
                    flex: 4,
                    child: ListView(
                      children: const [
                        FavoritesTile(),
                        FavoritesTile(),
                        FavoritesTile(),
                        FavoritesTile(),
                        FavoritesTile(),
                        FavoritesTile(),
                        FavoritesTile(),
                        FavoritesTile(),
                        FavoritesTile(),
                      ],
                    ),
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
      /*floatingActionButton: Visibility(
        visible:  MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: FloatingActionButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage())),
          backgroundColor: Colors.grey.shade800,
          child: const Icon(
            Icons.search,
            color: Colors.orangeAccent,
          ),
        ),
      ),*/
    );
  }
}