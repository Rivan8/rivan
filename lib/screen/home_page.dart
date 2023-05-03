import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page_23april/screen/second_page.dart';
import 'package:login_page_23april/widget/card.dart';

import '../widget/sunday_service.dart';

// ignore: camel_case_types
class homePage extends StatelessWidget {
  homePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.home),
      //     label: 'Home',
      //   ),
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.bookmark),
      //     label: 'Bookmark',
      //   ),
      //   BottomNavigationBarItem(
      //     icon: Icon(Icons.person),
      //     label: 'Profil',
      //   ),
      // ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    color: Colors.deepOrangeAccent,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/man.png')),
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 2)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Hallo ' + user.email!,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xfff5f5f7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            cursorHeight: 20,
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: 'Cari Halaman',
                              hintStyle: GoogleFonts.montserrat(),
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepOrange, width: 2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Kategori(
                        ImagePath: 'assets/icons/bible.png',
                        title: 'Hagah',
                      ),
                    ),
                    Kategori(
                      ImagePath: 'assets/icons/calendar.png',
                      title: 'Event',
                    ),
                    Kategori(
                      ImagePath: 'assets/icons/book.png',
                      title: 'Next Step',
                    ),
                    Kategori(
                      ImagePath: 'assets/icons/video.png',
                      title: 'Sermons ',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Tentang ESC',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            sundayService(
                              ImagePath: 'assets/images/doa.jpg',
                              title: 'Sunday Service 1',
                              subtitle: '07.30',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            sundayService(
                              ImagePath: 'assets/images/worship.jpg',
                              title: 'Sunday Service 2',
                              subtitle: '11.00',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            sundayService(
                                ImagePath: 'assets/images/bibleclass.jpg',
                                title: 'Next Step',
                                subtitle: 'Kelas Pengajaran'),
                            SizedBox(
                              height: 20,
                            ),
                            sundayService(
                                ImagePath: 'assets/images/dc.jpg',
                                title: 'Disciples Community',
                                subtitle: 'Community'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
