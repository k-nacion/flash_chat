import 'package:flutter/material.dart';

import 'chat_bubble.dart';

class ChatBubbleContainer extends StatelessWidget {
  final bool isTheSender;
  final String message;
  final String sender;

  ChatBubbleContainer({
    required this.isTheSender,
    required this.message,
    required this.sender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChatBubble(message, sender, isTheSender),
    );
  }
}
