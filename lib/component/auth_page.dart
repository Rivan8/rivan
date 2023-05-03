import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screen/home_page.dart';
import '../screen/login_or_register_page.dart';
import '../widget/nav_bar.dart';

// ignore: camel_case_types
class authPage extends StatelessWidget {
  const authPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Nav();
          } else {
            return const loginOrRegisterPage();
          }
        },
      ),
    );
  }
}
