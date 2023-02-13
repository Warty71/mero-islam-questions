import 'package:apk_islamic_questions/Pages/auth_page.dart';
import 'package:apk_islamic_questions/Pages/home_page_v2.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import '../Pages/home_page.dart';
import '../Pages/search_page.dart';
import '../Pages/settings_page.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {


  List<ScreenHiddenDrawer> _pages = [];

  final firstTextStyle = const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  void initState() {
    super.initState();

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Test',
          baseStyle: firstTextStyle,
          selectedStyle: firstTextStyle,
          colorLineSelected: Colors.white,
        ),
        const HomePageV2(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Početna',
          baseStyle: firstTextStyle,
          selectedStyle: firstTextStyle,
          colorLineSelected: Colors.white,
        ),
        const HomePage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Profil',
          baseStyle: firstTextStyle,
          selectedStyle: firstTextStyle,
          colorLineSelected: Colors.white,
        ),
        const AuthPage(),
      ),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'Postavke',
          baseStyle: firstTextStyle,
          selectedStyle: firstTextStyle,
          colorLineSelected: Colors.white,
        ),
        const SettingsPage(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      /*backgroundMenu: const DecorationImage(
        image: ExactAssetImage("lib/Pictures/Picture 1.jpg"),
        fit: BoxFit.cover,
      ),*/
      leadingAppBar: const ImageIcon(
        AssetImage('lib/Icons/paragraph.png'),
      ),
      actionsAppBar: [
        IconButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: 'Sve',))),
          icon: const Icon(Icons.search),
        ),
      ],
      backgroundColorMenu: const Color.fromRGBO(81, 19, 1, 100),
      initPositionSelected: 0,
      slidePercent: 80.0,
      isDraggable: true,
      enableShadowItensMenu: true,
      contentCornerRadius: 30.0,
      enableCornerAnimation: true,
      enableScaleAnimation: true,
      curveAnimation: Curves.linear,
      withShadow: true,
      verticalScalePercent: 60.0,
      disableAppBarDefault: true,
    );
  }
}

