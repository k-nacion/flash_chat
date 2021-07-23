import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/models/user.dart' as model;
import 'package:flash_chat/widgets/forms/text_form_input_field.dart';
import 'package:flutter/material.dart';

import 'form_area.dart';

class SignUpFormArea extends StatelessWidget {
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return FormArea(
      textFormList: [
        TextFormInputField(
          hint: 'First Name',
          controller: firstNameTextController,
          keyboardType: TextInputType.name,
          validator: (string) {
            if (string == null || string.isEmpty || (string.length <= 1)) {
              return 'Required field!';
            }
          },
          textInputAction: TextInputAction.next,
        ),
        TextFormInputField(
          hint: 'Last Name',
          controller: lastNameTextController,
          keyboardType: TextInputType.name,
          validator: (string) {
            if (string == null || string.isEmpty || (string.length <= 1)) {
              return 'Required field!';
            }
          },
          textInputAction: TextInputAction.next,
        ),
        TextFormInputField(
          hint: 'Email',
          keyboardType: TextInputType.emailAddress,
          controller: emailTextController,
          validator: (string) {
            if (string == null || string.isEmpty || (string.length <= 1)) {
              return 'Required field!';
            }
            //TODO: implement a logic where in it checks correct format of the email.
            //Known issue is that UI doesn't show when the email is not correct format.
            //Firebase throws an error but no solution I have come up with yet.
          },
          textInputAction: TextInputAction.next,
        ),
        TextFormInputField(
          hint: 'Password',
          keyboardType: TextInputType.text,
          controller: passwordTextController,
          obscureText: true,
          validator: (string) {
            if (string == null || string.isEmpty || (string.length <= 6)) {
              return 'Password must be at least 6 characters';
            }
          },
          textInputAction: TextInputAction.done,
        ),
      ],
      buttonLabel: 'Sign Up',
      whenFormIsValid: () async {
        try {
          final user = model.User(
              firstName: firstNameTextController.value.text,
              lastName: lastNameTextController.value.text,
              email: emailTextController.value.text);

          await _auth.createUserWithEmailAndPassword(
              email: user.email, password: passwordTextController.value.text);

          await _firestore.collection('/users').add(user.toMap());

          Navigator.pop(
              context,
              SnackBar(
                content: Text('User has been created'),
                action: SnackBarAction(
                  label: 'Dismiss',
                  onPressed: () {},
                ),
              ));
        } on Exception catch (e) {
          print(e);
        }
      },
    );
  }
}
