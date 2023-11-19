import 'package:chatting_zone/servises/Auth_Servise.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chatting_Page1.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void SignOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatting"),
        centerTitle: true,
        actions: [IconButton(onPressed: SignOut, icon: Icon(Icons.logout))],
      ),
      body: _BuildUserList(),
    );
  }

  Widget _BuildUserList() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("uid").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("Error"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text("Loading..."));
        }
        return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _BuildUserListItem(doc))
                .toList());
      },
    );
  }

  Widget _BuildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(
          data['email'],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Chatting_page(
                reciverUserEmail: data["email"],
                reciverUserID: data["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
