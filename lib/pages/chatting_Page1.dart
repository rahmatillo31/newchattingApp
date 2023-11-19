import 'package:chatting_zone/chatting/chat_service.dart';
import 'package:chatting_zone/components/Text_Field1.dart';
import 'package:chatting_zone/components/chat_babble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chatting_page extends StatefulWidget {
  final String reciverUserEmail;
  final String reciverUserID;

  const Chatting_page(
      {super.key, required this.reciverUserEmail, required this.reciverUserID});

  @override
  State<Chatting_page> createState() => _Chatting_pageState();
}

class _Chatting_pageState extends State<Chatting_page> {
  final TextEditingController txtController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    //only send message if there is something to send
    if (txtController.text.isNotEmpty) {
      await _chatService.sendMessage(widget.reciverUserID, txtController.text);
      //clear the text controller after sending the message
      txtController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.reciverUserEmail),
      ),
      body: Column(
        children: [
          //message

          Expanded(child: _buildMessageList()),
          //user input
          _buildMessageInput(),


          SizedBox(height: 25,)
        ],
      ),
    );
  }

//build message list
  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessage(
            widget.reciverUserID, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Text('Error${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }
          return ListView(
            children: snapshot.data!.docs
                .map((dacument) => _buildMessageItem(dacument))
                .toList(),
          );
        });
  }

//build message item

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    //align the Maessage
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            Text(data['senderEmsil']),
            SizedBox(
              height: 5,
            ),
            ChatBabble(message: data['message'])
          ],
        ),
      ),
    );
  }

//building message input

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          //textfield
          Expanded(
            child: MyTextField(
                controller: txtController,
                hintText: "Enter Message",
                ObscureText: false),
          ),

          //sendbuttom
          IconButton(onPressed: sendMessage, icon: Icon(Icons.send_rounded)),
        ],
      ),
    );
  }
}

//build message list

//build message item
