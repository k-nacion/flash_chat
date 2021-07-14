import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WelcomeBrand extends StatefulWidget {
  @override
  _WelcomeBrandState createState() => _WelcomeBrandState();
}

class _WelcomeBrandState extends State<WelcomeBrand> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: 'brand_logo',
          child: Container(
            child: Image.asset('images/logo.png'),
            height: 100.0,
          ),
        ),
        AnimatedTextKit(
          repeatForever: true,
          isRepeatingAnimation: true,
          animatedTexts: [
            TypewriterAnimatedText(
              'Flash Chat',
              speed: Duration(milliseconds: 180),
              textStyle: TextStyle(
                fontSize: 45.0,
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
