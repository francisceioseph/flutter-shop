import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingButtons extends StatelessWidget {
  final void Function() onRegisterTap;
  final void Function() onLoginTap;

  const LandingButtons({
    Key key,
    this.onRegisterTap,
    this.onLoginTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(FontAwesomeIcons.pencilAlt),
              label: Text('Register Now'),
              onPressed: onRegisterTap,
            ),
            VerticalDivider(
              color: Colors.red,
            ),
            FlatButton.icon(
              icon: Icon(FontAwesomeIcons.signInAlt),
              label: Text('Sign In'),
              onPressed: onLoginTap,
            ),
          ],
        ),
      ),
    );
  }
}
