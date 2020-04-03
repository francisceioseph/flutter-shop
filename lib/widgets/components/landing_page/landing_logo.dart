import 'package:flutter/material.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;

    return Container(
      margin: EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                  bottom: 8,
                  right: 16,
                  left: 16,
                ),
                child: Text('Flutter Store', style: textTheme.title),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 8,
                  bottom: 16,
                  right: 16,
                  left: 16,
                ),
                child: Text('A simple store for you', style: textTheme.subhead),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
