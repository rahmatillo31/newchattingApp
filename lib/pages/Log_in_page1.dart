import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/My_Buttom.dart';
import '../components/Text_Field1.dart';
import '../servises/Auth_Servise.dart';

class Log_inP extends StatefulWidget {
  final void Function()? ontap;

  const Log_inP({super.key, required this.ontap});

  @override
  State<Log_inP> createState() => _Log_inPState();
}

class _Log_inPState extends State<Log_inP> {
  final Emailcontroller = TextEditingController();
  final PassWordcontroller = TextEditingController();

  //Log in

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailandPassword(
          Emailcontroller.text, PassWordcontroller.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                SizedBox(
                  height: 180,
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
                  "Let's Create Account",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
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
                SizedBox(
                  height: 25,
                ),
                //bottom
                My_bottom1(onTap: signIn, text: "sign in"),
                SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a Member",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        "Registar now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    )
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
