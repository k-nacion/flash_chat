import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/routes/chat_screen.dart';
import 'package:flash_chat/routes/sign_in_screen.dart';
import 'package:flash_chat/routes/sign_up_screen.dart';
import 'package:flash_chat/routes/splash_screen.dart';
import 'package:flash_chat/util/constants/routes.dart';
import 'package:flash_chat/util/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (_) => SplashScreen(),
        Routes.signIn: (_) => SignInScreen(),
        Routes.signUp: (_) => SignUpScreen(),
        Routes.chat: (_) => ChatScreen(),
      },
    );
  }
}
