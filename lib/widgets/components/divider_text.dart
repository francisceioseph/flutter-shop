import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  final String text;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const DividerText({
    Key key,
    @required this.text,
    this.margin = const EdgeInsets.only(
      right: 16,
      left: 16,
      top: 8,
      bottom: 8,
    ),
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      padding: this.padding,
      child: Row(children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 8),
            child: Divider(),
          ),
        ),
        Text(text),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 8),
            child: Divider(),
          ),
        ),
      ]),
    );
  }
}
