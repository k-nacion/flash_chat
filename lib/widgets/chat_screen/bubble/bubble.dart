import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  final String message;

  Bubble({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Text(message),
    );
  }
}
