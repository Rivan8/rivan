import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Kategori extends StatelessWidget {
  final String ImagePath;
  final String title;
  const Kategori({super.key, required this.ImagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 60,
          height: 60,
          child: Column(
            children: [
              Image.asset(
                ImagePath,
                width: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: GoogleFonts.montserrat(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
