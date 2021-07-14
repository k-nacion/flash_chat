import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final String? hint;
  final TextInputType? keyboardType;
  final String obscurringCharacter;
  final bool? obscureText;
  final TextEditingController? controller;

  TextInputField({
    this.hint,
    this.keyboardType,
    this.obscureText,
    this.obscurringCharacter = '•',
    this.controller,
  });

  @override
  _TextInputFieldState createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      obscuringCharacter: widget.obscurringCharacter,
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        hintText: widget.hint,
      ),
    );
  }
}
