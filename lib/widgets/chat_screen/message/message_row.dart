import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/widgets/chat_screen/bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageRow extends StatelessWidget {
  final Message message;

  MessageRow({required this.message});

  final _auth = FirebaseAuth.instance;
  late final isFromCurrentUser = message.author == _auth.currentUser!.email;

  late final _rowItemList = [
    Bubble(message: message.message),
    Text(
      DateFormat.jm().format(message.dateTime),
      style: TextStyle(fontSize: 11.5),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: isFromCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              isFromCurrentUser ? 'You' : message.author,
              style: TextStyle(fontSize: 11.5),
            ),
          ),
          Row(
            mainAxisAlignment: isFromCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: isFromCurrentUser ? _rowItemList.reversed.toList() : _rowItemList,
          ),
        ],
      ),
    );
  }
}
