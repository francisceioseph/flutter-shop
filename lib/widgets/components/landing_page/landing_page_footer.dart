import 'package:flutter/material.dart';

class LandingPageFooter extends StatelessWidget {
  final void Function() onLoginButtonPressed;

  const LandingPageFooter({
    Key key,
    @required this.onLoginButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Already have an account?',
              style: theme.primaryTextTheme.title.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: FlatButton(
              child: Text(
                'login here',
                style: theme.primaryTextTheme.subhead.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: onLoginButtonPressed,
            ),
          )
        ],
      ),
    );
  }
}
