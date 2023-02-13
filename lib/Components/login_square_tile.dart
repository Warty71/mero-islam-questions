import 'package:flutter/material.dart';


class SquareTile extends StatelessWidget {

  final String imagePath;
  final Function()? onTap;
  const SquareTile({Key? key, required this.imagePath, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Image.asset(
            imagePath, height: 40,
          ),
        ),
      ),
    );
  }
}
