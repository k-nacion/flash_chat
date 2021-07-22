import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/services/firebase_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bubble.dart';

class BubbleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Message>>(
      stream: FirestoreHelper.retrieveStreamMessagesWithConverter(descending: true),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final _messageCollection = snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: _messageCollection.size,
            itemBuilder: (_, index) {
              final message = _messageCollection.docs[index].data();
              return Bubble(message: message);
            },
            reverse: true,
          );
        }

        return Center(
            child: Text(snapshot.hasError
                ? 'An error occurred fetching the conversations'
                : 'No Conversation yet'));
      },
    );
  }
}
