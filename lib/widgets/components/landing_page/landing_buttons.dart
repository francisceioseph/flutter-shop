import 'package:flutter/material.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:line_icons/line_icons.dart';

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
    final translator = AppLocalizations.of(context);

    return Card(
      margin: EdgeInsets.all(16),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(LineIcons.pencil_square),
              label: Text(
                translator.translate('landing_register_now'),
                style: Theme.of(context).primaryTextTheme.button.copyWith(
                      fontFamily: 'BellotaText',
                      fontWeight: FontWeight.w700,
                    ),
              ),
              onPressed: onRegisterTap,
            ),
            VerticalDivider(
              color: Colors.red,
            ),
            FlatButton.icon(
              icon: Icon(LineIcons.sign_in),
              label: Text(
                translator.translate('landing_sign_in'),
                style: Theme.of(context).primaryTextTheme.button.copyWith(
                      fontFamily: 'BellotaText',
                      fontWeight: FontWeight.w700,
                    ),
              ),
              onPressed: onLoginTap,
            ),
          ],
        ),
      ),
    );
  }
}
