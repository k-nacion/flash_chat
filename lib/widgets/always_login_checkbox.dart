import 'package:flutter/material.dart';

//This is a useless feature. need to fix this.
//But for now, it is only for Frontend.
class AlwaysLoginCheckbox extends StatefulWidget {
  final bool value;

  AlwaysLoginCheckbox({
    required this.value,
  });

  @override
  _AlwaysLoginCheckboxState createState() => _AlwaysLoginCheckboxState();
}

class _AlwaysLoginCheckboxState extends State<AlwaysLoginCheckbox> {
  var value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (value) {
            setState(() {
              value = value!;
            });
          },
        ),
        SizedBox(width: 8),
        Text(
          'Keep me signed in',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
