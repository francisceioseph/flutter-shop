import 'package:flutter/material.dart';
import 'package:flutter_shop/config/feature_toggles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialSignIn extends StatelessWidget {
  final void Function() onFacebookTap;
  final void Function() onGoogleTap;

  const SocialSignIn({
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
            if (kFacebookLogginToggle)
              FlatButton.icon(
                icon: Icon(FontAwesomeIcons.facebook),
                label: Text(
                  'Facebook',
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onPressed: onFacebookTap,
              ),
            FlatButton.icon(
              icon: Icon(FontAwesomeIcons.google),
              label: Text(
                'Google',
                style: Theme.of(context).primaryTextTheme.button,
              ),
              onPressed: onGoogleTap,
            ),
          ],
        ),
      ),
    );
  }
}
