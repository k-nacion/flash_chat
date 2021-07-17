import 'package:flash_chat/util/constants/routes.dart';
import 'package:flash_chat/widgets/app_title_logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    final duration = Duration(milliseconds: 2000);
    Future.delayed(duration, () => Navigator.popAndPushNamed(context, Routes.signIn));

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Hero(
            tag: 'appTitleLogo',
            child: AppTitleLogo(),
          ),
        ),
      ),
    );
  }
}
