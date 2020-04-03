import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterSocial extends StatelessWidget {
  final void Function() onFacebookTap;
  final void Function() onGoogleTap;

  const RegisterSocial({
    Key key,
    this.onFacebookTap,
    this.onGoogleTap,
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
              onPressed: onFacebookTap,
            ),
            FlatButton.icon(
              icon: Icon(FontAwesomeIcons.google),
              label: Text('Google'),
              onPressed: onGoogleTap,
            ),
          ],
        ),
      ),
    );
  }
}
