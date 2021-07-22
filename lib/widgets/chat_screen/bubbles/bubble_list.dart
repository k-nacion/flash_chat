import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/services/firebase_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bubble.dart';

class BubbleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirestoreHelper.retrieveStreamMessages(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final _messageCollection = snapshot.data!;
          final _reverseList = _messageCollection.docs.reversed.toList();

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: _messageCollection.size,
            itemBuilder: (_, index) {
              final author = _reverseList[index].data()[MessageFields.author.toString()];
              final message = _reverseList[index].data()[MessageFields.message.toString()];
              final dateTime =
                  (_reverseList[index].data()[MessageFields.datetime.toString()] as Timestamp)
                      .toDate();

              return Bubble(
                message: Message(author: author, message: message, dateTime: dateTime),
              );
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
