import 'package:flutter/material.dart';

class SimpleOutlineButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final EdgeInsetsGeometry margin;

  const SimpleOutlineButton({
    Key key,
    this.child,
    this.margin,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      child: OutlineButton(
        color: Theme.of(context).accentColor,
        // textColor: Theme.of(context).accentColor,
        borderSide: BorderSide(
          color: Theme.of(context).accentColor,
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
