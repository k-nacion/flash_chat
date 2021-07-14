import 'package:flash_chat/util/constants/routes.dart';
import 'package:flutter/material.dart';

import '../../material_button.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'Login',
      onPressed: () => Navigator.pushNamed(context, Routes.login),
      color: Theme.of(context).primaryColor,
    );
  }
}
