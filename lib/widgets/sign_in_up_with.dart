import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'circular_button.dart';

class SocialSitesButtons extends StatelessWidget {
  final String caption;

  const SocialSitesButtons({Key? key, required this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            Text(caption),
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
    );
  }
}
