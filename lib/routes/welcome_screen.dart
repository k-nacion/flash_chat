import 'package:flash_chat/widgets/routes/welcome/login_button.dart';
import 'package:flash_chat/widgets/routes/welcome/register_button.dart';
import 'package:flash_chat/widgets/welcome_brand.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            WelcomeBrand(),
            SizedBox(height: 48.0),
            LoginButton(),
            RegisterButton(),
          ],
        ), 
      ),
    );
  }
}
