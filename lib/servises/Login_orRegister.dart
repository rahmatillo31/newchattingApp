

import 'package:flutter/material.dart';

import '../pages/Log_in_page1.dart';
import '../pages/registar_page.dart';

class LoginorRegister extends StatefulWidget {
  const LoginorRegister({super.key});

  @override
  State<LoginorRegister> createState() => _LoginorRegisterState();
}

class _LoginorRegisterState extends State<LoginorRegister> {
  bool showLoginpage = true;


  void tagglePages() {
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return Log_inP(ontap: tagglePages);
    } else {
      return Register_page(ontap: tagglePages);
    }
  }
}
