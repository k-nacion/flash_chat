import 'package:flash_chat/widgets/always_login_checkbox.dart';
import 'package:flash_chat/widgets/routes/solid_button.dart';
import 'package:flash_chat/widgets/text_input.dart';
import 'package:flutter/material.dart';

class FormArea extends StatelessWidget {
  FormArea({
    required this.textFormList,
    required this.buttonLabel,
    required this.whenFormIsValid,
    this.whenFormIsInvalid,
    this.otherForm,
  });

  final List<TextFormInputField> textFormList;
  final String buttonLabel;
  final void Function() whenFormIsValid;
  final void Function()? whenFormIsInvalid;

  /// [otherForm] will insert any widgets between the TextFormFields and
  /// the form's button.
  ///
  /// only use this if you are going to add another type of form
  final Widget? otherForm;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 48),
          ..._renderTextFormList(),
          if (otherForm != null)
            Column(
              children: [
                otherForm!,
                SizedBox(height: 16),
              ],
            ),
          SolidTextButton(
            text: buttonLabel,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                whenFormIsValid();
              } else {
                if (whenFormIsInvalid != null) {
                  whenFormIsInvalid!();
                }
              }
            },
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  Iterable _renderTextFormList() {
    return textFormList.map((TextFormInputField form) => Column(
          children: [
            form,
            SizedBox(height: 16),
          ],
        ));
  }

  Widget? renderOtherForms() {
    return otherForm != null ? otherForm : null;
  }
}

class LoginFormArea extends StatefulWidget {
  LoginFormArea({
    Key? key,
    required this.usernameTextController,
    required this.passwordTextController,
    required this.isAlwaysLoggedIn,
  });

  final bool isAlwaysLoggedIn;
  final TextEditingController usernameTextController;
  final TextEditingController passwordTextController;

  @override
  _LoginFormAreaState createState() => _LoginFormAreaState();
}

class _LoginFormAreaState extends State<LoginFormArea> {
  @override
  Widget build(BuildContext context) {
    return FormArea(
      textFormList: [
        TextFormInputField(
          hint: 'Email',
          keyboardType: TextInputType.emailAddress,
          controller: widget.usernameTextController,
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
        ),
      ],
      otherForm: AlwaysLoginCheckbox(value: widget.isAlwaysLoggedIn),
      buttonLabel: 'Sign In',
      whenFormIsValid: () {},
    );
  }
}

class SignUpFormArea extends StatelessWidget {
  final TextEditingController firstNameTextController;
  final TextEditingController lastNameTextController;
  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  SignUpFormArea({
    required this.firstNameTextController,
    required this.lastNameTextController,
    required this.emailTextController,
    required this.passwordTextController,
  });

  @override
  Widget build(BuildContext context) {
    return FormArea(
      textFormList: [
        TextFormInputField(
          hint: 'First Name',
          controller: firstNameTextController,
          keyboardType: TextInputType.name,
        ),
        TextFormInputField(
          hint: 'Last Name',
          controller: lastNameTextController,
          keyboardType: TextInputType.name,
        ),
        TextFormInputField(
          hint: 'Email',
          keyboardType: TextInputType.emailAddress,
          controller: emailTextController,
        ),
        TextFormInputField(
          hint: 'Password',
          keyboardType: TextInputType.text,
          controller: passwordTextController,
          obscureText: true,
        ),
      ],
      buttonLabel: 'Sign Up',
      whenFormIsValid: () {},
    );
  }
}
