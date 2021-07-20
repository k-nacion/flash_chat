import 'package:flash_chat/util/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String textMessage;
  final String sender;
  final bool isTheSender;

  ChatBubble(this.textMessage, this.sender, [this.isTheSender = true]);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isTheSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: 200),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: this.isTheSender
                ? BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16))
                : BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
            color: this.isTheSender ? Theme.of(context).accentColor : AppColorGreen.magicMint),
        child: Column(
          crossAxisAlignment: this.isTheSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: Theme.of(context).textTheme.overline,
            ),
            Text(
              textMessage,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
