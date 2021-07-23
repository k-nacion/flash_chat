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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isFromCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message.author),
        Row(
          mainAxisAlignment: isFromCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          verticalDirection: isFromCurrentUser ? VerticalDirection.up : VerticalDirection.down,
          children: [
            Bubble(message: message.message),
            Text(DateFormat.jm().format(message.dateTime)),
          ],
        ),
      ],
    );
  }
}
