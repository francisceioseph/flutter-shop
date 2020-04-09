import 'package:flutter/material.dart';
import 'package:flutter_shop/services/app_localizations.dart';

class LandingLogo extends StatelessWidget {
  const LandingLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;
    final _translator = AppLocalizations.of(context);

    return Container(
      margin: EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: AspectRatio(
        aspectRatio: 1,
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
              child: Text(
                _translator.translate('app_title'),
                style: textTheme.title.copyWith(
                  fontFamily: 'BellotaText',
                  fontSize: 32,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 8,
                bottom: 16,
                right: 16,
                left: 16,
              ),
              child: Text(
                _translator.translate('landing_logo_text'),
                style: textTheme.subhead.copyWith(
                  fontFamily: 'BellotaText',
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
