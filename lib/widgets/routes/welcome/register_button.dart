import 'package:flash_chat/util/constants/routes.dart';
import 'package:flutter/material.dart';

import '../../material_button.dart';

class RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'Register',
      onPressed: () => Navigator.pushNamed(context, Routes.registration),
      color: Theme.of(context).accentColor,
    );
  }
}
