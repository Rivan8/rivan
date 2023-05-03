import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class sundayService extends StatelessWidget {
  final String ImagePath;
  final String title;
  final String subtitle;
  const sundayService(
      {super.key,
      required this.ImagePath,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Image.asset(
              ImagePath,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '9.0',
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.access_time,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      subtitle,
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
