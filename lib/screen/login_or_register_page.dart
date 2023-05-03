// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page_23april/screen/login_page.dart';
import 'package:login_page_23april/screen/register_page.dart';

// ignore: camel_case_types
class loginOrRegisterPage extends StatefulWidget {
  const loginOrRegisterPage({super.key});

  @override
  State<loginOrRegisterPage> createState() => _loginOrRegisterPageState();
}

// ignore: camel_case_types
class _loginOrRegisterPageState extends State<loginOrRegisterPage> {
  // initially show login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return loginPage(
        onTap: togglePages,
      );
    } else {
      return registerPage(
        onTap: togglePages,
      );
    }
  }
}
