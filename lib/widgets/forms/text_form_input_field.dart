import 'package:flutter/material.dart';

class TextFormInputField extends TextFormField {
  TextFormInputField({
    Key? key,
    String? hint,
    TextInputType? keyboardType,
    bool? obscureText,
    String obscuringCharacter = '•',
    TextEditingController? controller,
    String? Function(String?)? validator,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted,
  }) : super(
          key: key,
          keyboardType: keyboardType,
          obscuringCharacter: obscuringCharacter,
          controller: controller,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: hint,
          ),
          textInputAction: textInputAction,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
        );
}
