import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLogin extends StatelessWidget {
  final void Function() onFacebookLoginPressed;
  final void Function() onGoogleLoginPressed;

  const SocialLogin({
    Key key,
    this.onFacebookLoginPressed,
    this.onGoogleLoginPressed,
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
              icon: Icon(FontAwesomeIcons.facebook),
              label: Text('Facebook'),
              onPressed: onFacebookLoginPressed,
            ),
            FlatButton.icon(
              icon: Icon(FontAwesomeIcons.google),
              label: Text('Google'),
              onPressed: onGoogleLoginPressed,
            ),
          ],
        ),
      ),
    );
  }
}
