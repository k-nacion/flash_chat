import 'package:flash_chat/models/message.dart';
import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  final Message message;

  Bubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(message.message)],
    );
  }
}
