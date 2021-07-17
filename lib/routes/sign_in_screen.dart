import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/util/constants/routes.dart';
import 'package:flash_chat/widgets/app_title_logo.dart';
import 'package:flash_chat/widgets/form_area.dart';
import 'package:flash_chat/widgets/sign_in_up_with.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  static const route = '/signIn';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  var _auth = FirebaseAuth.instance;
  var _isAlwaysLoggedIn = false;

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
                LoginFormArea(
                  usernameTextController: _usernameTextController,
                  passwordTextController: _passwordTextController,
                  isAlwaysLoggedIn: _isAlwaysLoggedIn,
                ),
                // SizedBox(height: 32),
                SocialSitesButtons(caption: 'or Sign In With'),
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
    var snackBar = await Navigator.pushNamed(context, Routes.signUp);

    ScaffoldMessenger.of(context).showSnackBar(snackBar as SnackBar);
  }
}
