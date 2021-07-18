import 'package:flutter/material.dart';

class SolidButton extends StatelessWidget {
  final Color? color;
  final Color? splashColor;
  final void Function()? onTap;
  final Widget? child;
  final double? verticalPadding;
  final double? horizontalPadding;

  SolidButton({
    Key? key,
    this.color,
    this.splashColor,
    this.onTap,
    this.child,
    this.verticalPadding,
    this.horizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Theme.of(context).primaryColor,
      child: InkWell(
        splashColor: splashColor ?? Colors.black.withOpacity(.5),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 16, horizontal: horizontalPadding ?? 0),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}

class SolidTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  final Color? buttonColor;
  final Color? splashColor;
  final void Function()? onTap;
  final double? verticalPadding;
  final double? horizontalPadding;

  SolidTextButton({
    Key? key,
    required this.text,
    this.textStyle,
    this.buttonColor,
    this.splashColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SolidButton(
      onTap: onTap,
      splashColor: splashColor,
      color: buttonColor,
      horizontalPadding: horizontalPadding,
      verticalPadding: verticalPadding,
      child: Text(
        text,
        style: textStyle ??
            Theme.of(context)
                .textTheme
                .button!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
