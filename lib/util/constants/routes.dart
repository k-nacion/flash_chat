import 'package:flash_chat/routes_mock/sign_in_screen.dart';
import 'package:flash_chat/routes_mock/sign_up_screen.dart';
import 'package:flash_chat/routes_mock/splash_screen.dart';

class Routes {
  static const welcome = '/';
  static const registration = '/registration';
  static const login = '/login';
  static const chat = '/chat';
}

class NewRoutes {
  static const splash = SplashScreen.route;
  static const signIn = SignInScreen.route;
  static const signUp = SignUpScreen.route;
}
