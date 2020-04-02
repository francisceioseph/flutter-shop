import 'package:flutter/material.dart';

class LandingRegisterButton extends StatelessWidget {
  final void Function() onPressed;

  const LandingRegisterButton({
    Key key,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RaisedButton(
      onPressed: onPressed,
      color: theme.accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Text(
          'Get Started Now',
          style: theme.accentTextTheme.title,
        ),
      ),
    );
  }
}
