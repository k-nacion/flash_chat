import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widgets/app_title_logo.dart';
import 'package:flash_chat/widgets/circular_button.dart';
import 'package:flash_chat/widgets/forms/form_area_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  static const route = '/signUp';

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              // decoration: BoxDecoration(border: Border.all()),
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(tag: 'appTitleLogo', child: AppTitleLogo()),
                  SizedBox(height: 72),
                  Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a user?',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                      ),
                      SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          //TODO: implement the action for this.`
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign In',
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).accentColor,
                                letterSpacing: 1,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SignUpFormArea(),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color(0xFFCFCFCF),
                          thickness: 2,
                          endIndent: 22,
                        ),
                      ),
                      Text('Or Sign Up With'),
                      Expanded(
                        child: Divider(
                          indent: 22,
                          color: Color(0xFFCFCFCF),
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircularButton(icon: FontAwesomeIcons.google),
                      CircularButton(icon: FontAwesomeIcons.facebook),
                      CircularButton(icon: FontAwesomeIcons.linkedin),
                      CircularButton(icon: FontAwesomeIcons.twitter),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
