import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/services/firebase_helper.dart';
import 'package:flash_chat/util/constants/routes.dart';
import 'package:flash_chat/widgets/chat_screen/bubbles/bubble_list.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const route = '/chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController chatMessage = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () async {
                await _auth.signOut();
                Navigator.popAndPushNamed(context, Routes.splash);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: BubbleList()),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                      controller: chatMessage,
                    ),
                  ),
                  TextButton(
                    onPressed: sendMessage,
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage() async {
    FirestoreHelper.storeMessage(
      message: Message(
        message: chatMessage.value.text,
        author: _auth.currentUser!.email!,
      ),
    );

    chatMessage.clear();
  }

  void getMessage() async {
    FirestoreHelper.retrieveMessages();
  }
}
