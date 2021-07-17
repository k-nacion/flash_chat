import 'package:flash_chat/routes/chat_screen.dart';
import 'package:flash_chat/routes/sign_in_screen.dart';
import 'package:flash_chat/routes/sign_up_screen.dart';
import 'package:flash_chat/routes/splash_screen.dart';

/******************************************
 * DON'T FORGET TO ADD NEW ADDED           *
 * ROUTES TO [main.dart]'s routes property*
 * ****************************************/

class Routes {
  static const splash = SplashScreen.route;
  static const signIn = SignInScreen.route;
  static const signUp = SignUpScreen.route;
  static const chat = ChatScreen.route;
}
