import 'package:flutter/material.dart';

class TextFormInputField extends StatefulWidget {
  final String? hint;
  final TextInputType? keyboardType;
  final String obscurringCharacter;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  TextFormInputField({
    this.hint,
    this.keyboardType,
    this.obscureText,
    this.obscurringCharacter = '•',
    this.controller,
    this.validator,
  });

  @override
  _TextFormInputFieldState createState() => _TextFormInputFieldState();
}

class _TextFormInputFieldState extends State<TextFormInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscuringCharacter: widget.obscurringCharacter,
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      decoration: InputDecoration(
        hintText: widget.hint,
      ),
      validator: widget.validator,
    );
  }
}
