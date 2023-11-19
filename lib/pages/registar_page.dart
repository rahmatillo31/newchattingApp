import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/My_Buttom.dart';
import '../components/Text_Field1.dart';
import '../servises/Auth_Servise.dart';

class Register_page extends StatefulWidget {
  final void Function()? ontap;

  const Register_page({super.key, required this.ontap});

  @override
  State<Register_page> createState() => _Register_pageState();
}

class _Register_pageState extends State<Register_page> {
  final Emailcontroller = TextEditingController();
  final PassWordcontroller = TextEditingController();
  final PassConiformcontroller = TextEditingController();

  //sign up

  void signUp() async {
    if (PassWordcontroller.text != PassConiformcontroller.text) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Password is not Match")));
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailandPassword(
          Emailcontroller.text, PassWordcontroller.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                //logo
                Icon(
                  Icons.chat_sharp,
                  size: 110,
                ),
                SizedBox(
                  height: 20,
                ),
                //Text
                Text(
                  "Let's create an account for you",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.grey),
                  //textfield
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: Emailcontroller,
                    hintText: "Email",
                    ObscureText: false),
                MyTextField(
                    controller: PassWordcontroller,
                    hintText: "Password",
                    ObscureText: true),
                //Coniform password
                MyTextField(
                    controller: PassConiformcontroller,
                    hintText: "Coniform Password",
                    ObscureText: true),
                SizedBox(
                  height: 25,
                ),
                //bottom sign up
                My_bottom1(onTap: signUp, text: "Sign Up"),
                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a Member? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        "Log in now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
