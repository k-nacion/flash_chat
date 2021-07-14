import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTitleLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.bolt,
          size: 65,
          color: Theme.of(context).primaryColor,
        ),
        SizedBox(width: 8),
        Text(
          'FlashChat',
          style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).iconTheme.color,
              ),
        )
      ],
    );
  }
}
