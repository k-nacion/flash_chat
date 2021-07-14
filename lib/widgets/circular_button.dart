import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;

  CircularButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      type: MaterialType.circle,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        splashColor: Colors.black.withOpacity(.5),
        onTap: () {},
        child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(),
            ),
            clipBehavior: Clip.hardEdge,
            child: Icon(this.icon)),
      ),
    );
  }
}
