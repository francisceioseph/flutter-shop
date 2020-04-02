import 'package:flutter/material.dart';

class OutlineFormButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  OutlineFormButton({
    Key key,
    @required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: ListTile(
        title: OutlineButton(
          child: Text(
            this.text,
            style: theme.primaryTextTheme.subtitle,
          ),
          color: theme.accentColor,
          textColor: theme.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          borderSide: BorderSide(
            color: theme.accentColor,
          ),
          onPressed: this.onPressed,
        ),
      ),
    );
  }
}
