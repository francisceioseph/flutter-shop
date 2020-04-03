import 'package:flutter/material.dart';

class ProductButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onPressed;

  const ProductButton({
    Key key,
    @required this.text,
    this.color,
    this.onPressed,
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: 16,
      ),
      child: SizedBox.expand(
        child: OutlineButton(
          color: color ?? Theme.of(context).accentColor,
          textColor: color ?? Theme.of(context).accentColor,
          borderSide: BorderSide(
            color: color ?? Theme.of(context).accentColor,
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
