import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/services/firebase_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'message_row.dart';

class MessageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Message>>(
      stream: FirestoreHelper.retrieveStreamMessagesWithConverter(descending: true),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final _messageCollection = snapshot.data!;

          return ListView.builder(
            itemCount: _messageCollection.size,
            itemBuilder: (_, index) {
              final message = _messageCollection.docs[index].data();
              return MessageRow(message: message);
            },
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 8),
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
