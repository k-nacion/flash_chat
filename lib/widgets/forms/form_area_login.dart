import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/util/constants/routes.dart';
import 'package:flash_chat/widgets/forms/text_form_input_field.dart';
import 'package:flutter/material.dart';

import 'form_area.dart';

class LoginFormArea extends StatefulWidget {
  final void Function(bool value) isHudLoading;

  LoginFormArea({
    required this.isHudLoading,
    required this.usernameTextController,
    required this.passwordTextController,
  });

  final TextEditingController usernameTextController;
  final TextEditingController passwordTextController;

  @override
  _LoginFormAreaState createState() => _LoginFormAreaState();
}

class _LoginFormAreaState extends State<LoginFormArea> {
  var _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FormArea(
      textFormList: [
        TextFormInputField(
          hint: 'Email',
          keyboardType: TextInputType.emailAddress,
          controller: widget.usernameTextController,
          textInputAction: TextInputAction.next,
        ),
        TextFormInputField(
          hint: 'Password',
          obscureText: true,
          keyboardType: TextInputType.text,
          controller: widget.passwordTextController,
          validator: (string) {
            if (string == null || string.isEmpty || (string.length <= 6)) {
              return 'Password must be at least 6 characters';
            }
          },
          onFieldSubmitted: (_) => _signIn(),
        ),
      ],
      buttonLabel: 'Sign In',
      whenFormIsValid: _signIn,
      whenFormIsInvalid: () {
        widget.isHudLoading(false);
      },
    );
  }

  void _signIn() async {
    widget.isHudLoading(true);

    late var user;
    try {
      user = await _auth.signInWithEmailAndPassword(
          email: widget.usernameTextController.value.text,
          password: widget.passwordTextController.value.text);
    } on Exception catch (e) {
      print(e);
    } finally {
      widget.isHudLoading(false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Oh no!'),
          content: Text('Username/Password did not match'),
        ),
      );
    }

    Navigator.popAndPushNamed(context, Routes.chat, arguments: user);
  }
}
