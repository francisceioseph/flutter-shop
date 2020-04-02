import 'package:flutter/material.dart';

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
            FlatButton(
              child: Text('Login with Facebook'),
              onPressed: onFacebookLoginPressed,
            ),
            FlatButton(
              child: Text('Login with Google'),
              onPressed: onGoogleLoginPressed,
            ),
          ],
        ),
      ),
    );
  }
}
