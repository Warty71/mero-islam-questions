import 'package:flutter/material.dart';

import '../Pages/search_page.dart';

class FavoritesTile extends StatefulWidget {
  const FavoritesTile({Key? key}) : super(key: key);

  @override
  State<FavoritesTile> createState() => _FavoritesTileState();
}

class _FavoritesTileState extends State<FavoritesTile> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 1.0),
      child: Material(
        color: Colors.blueGrey.shade600,
        child: InkWell(
          child: ListTile(
            title: const Text('Test title'),
            subtitle: const Text('Test subtitle'),
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage(filterString: "",))),
          ),
        ),
      ),
    );
  }
}


