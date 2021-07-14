import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widgets/app_title_logo.dart';
import 'package:flash_chat/widgets/circular_button.dart';
import 'package:flash_chat/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatelessWidget {
  static const route = '/signUp';

  final _auth = FirebaseAuth.instance;

  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: Center(
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
                  style:
                      Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
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
                SizedBox(height: 48),
                TextInputField(
                  hint: 'First Name',
                  controller: _firstNameTextController,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 16),
                TextInputField(
                  hint: 'Last Name',
                  controller: _lastNameTextController,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 16),
                TextInputField(
                  hint: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailTextController,
                ),
                SizedBox(height: 16),
                TextInputField(
                  hint: 'Password',
                  keyboardType: TextInputType.text,
                  controller: _passwordTextController,
                  obscureText: true,
                ),
                SizedBox(height: 16),
                SizedBox(height: 16),
                Material(
                  // type: MaterialType.transparency,
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    splashColor: Colors.black.withOpacity(.5),
                    onTap: () => signUpWithUsernameAndEmail(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
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
                Hero(
                  tag: 'sns',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircularButton(icon: FontAwesomeIcons.google),
                      CircularButton(icon: FontAwesomeIcons.facebook),
                      CircularButton(icon: FontAwesomeIcons.linkedin),
                      CircularButton(icon: FontAwesomeIcons.twitter),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void>? signUpWithUsernameAndEmail(BuildContext context) async {
    try {
      var userCreated = await _auth.createUserWithEmailAndPassword(
        email: _emailTextController.value.text,
        password: _passwordTextController.value.text,
      );

      var snackBar = SnackBar(
        content: Text('User has been created'),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {},
        ),
      );

      Navigator.pop(context, snackBar);
    } catch (e, s) {
      print(s);
      print(e);
    }
  }
}