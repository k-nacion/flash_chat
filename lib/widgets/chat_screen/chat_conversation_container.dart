import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/services/firebase_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_bubble_container.dart';

class ChatConversationContainer extends StatefulWidget {
  @override
  _ChatConversationContainerState createState() => _ChatConversationContainerState();
}

class _ChatConversationContainerState extends State<ChatConversationContainer> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirestoreHelper.retrieveStreamMessages(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final firestoreSnapshot = snapshot.data as QuerySnapshot<Map<String, dynamic>>;

              //TODO: Replace this UI with Listview.builder
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                verticalDirection: VerticalDirection.up,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  ...firestoreSnapshot.docs.map((document) {
                    final String message = document.data()['message'];
                    final String sender = document.data()['sender'];

                    return ChatBubbleContainer(
                        message: message,
                        sender: sender,
                        isTheSender: sender == FirebaseAuth.instance.currentUser!.email);
                    // return ChatBubble(
                    //     document.data()['message'] as String, document.data()['sender'] as String);
                  })
                ],
              );
            }

            return Center(
              child: Text('No Messages yet'),
            );
          },
        ),
      ),
    );
  }
}
