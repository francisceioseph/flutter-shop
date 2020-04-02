import 'package:flutter/material.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 270,
      height: 270,
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(600)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'FlutterStore',
            style: theme.primaryTextTheme.title.copyWith(
              fontSize: 32,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 16,
            ),
            child: Text(
              'A really simple store for you',
              style: theme.primaryTextTheme.body1.copyWith(fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
