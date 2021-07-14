import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/util/constants/routes.dart';
import 'package:flash_chat/widgets/app_title_logo.dart';
import 'package:flash_chat/widgets/circular_button.dart';
import 'package:flash_chat/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen extends StatefulWidget {
  static const route = '/signIn';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var _auth = FirebaseAuth.instance;
  var _keepSignIn = false;

  final _usernameTextController = TextEditingController();
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
                  'Sign In',
                  textAlign: TextAlign.center,
                  style:
                      Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New user?',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () => createUser(),
                      child: Text(
                        'Create an account',
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
                  hint: 'Username or email',
                  keyboardType: TextInputType.emailAddress,
                  controller: _usernameTextController,
                ),
                SizedBox(height: 16),
                TextInputField(
                  hint: 'Password',
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  controller: _passwordTextController,
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Checkbox(
                      value: _keepSignIn,
                      onChanged: (value) {
                        setState(() {
                          _keepSignIn = value!;
                        });
                      },
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Keep me signed in',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Material(
                  color: Theme.of(context).primaryColor,
                  child: InkWell(
                    splashColor: Colors.black.withOpacity(.5),
                    onTap: signInWithUsernameAndEmail,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Center(
                        child: Text(
                          'Sign In',
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
                    Text('Or Sign In With'),
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

  void signInWithUsernameAndEmail() async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: _usernameTextController.value.text, password: _passwordTextController.value.text);

      Navigator.popAndPushNamed(context, Routes.chat, arguments: user);
    } catch (e) {
      print(e);
    }
  }

  void createUser() async {
    var snackBar = await Navigator.pushNamed(context, NewRoutes.signUp);

    ScaffoldMessenger.of(context).showSnackBar(snackBar as SnackBar);
  }
}
