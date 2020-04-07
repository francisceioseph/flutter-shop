import 'package:flutter/material.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FinishOrderStep extends StatelessWidget {
  final void Function() onNextTap;
  final void Function() onBackTap;

  const FinishOrderStep({
    Key key,
    this.onNextTap,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;
    final translator = AppLocalizations.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(24),
            child: Text(
              translator.translate('congratulations_text').toUpperCase(),
              textAlign: TextAlign.center,
              style: textTheme.headline.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Text(
              translator.translate('about_order_text'),
              textAlign: TextAlign.center,
              style: textTheme.body1.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Text(
              translator.translate('thank_you_text'),
              textAlign: TextAlign.center,
              style: textTheme.body1.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Text(
              translator.translate('social_media_text'),
              textAlign: TextAlign.center,
              style: textTheme.body1.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(FontAwesomeIcons.facebook),
                  onPressed: () {},
                ),
                FloatingActionButton(
                  child: Icon(FontAwesomeIcons.instagram),
                  onPressed: () {},
                ),
                FloatingActionButton(
                  child: Icon(FontAwesomeIcons.twitter),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: FloatingActionButton(
              isExtended: true,
              child: Text(
                translator.translate('continue_shopping_button_text'),
              ),
              onPressed: () => _finishPurchase(context),
            ),
          ),
        ],
      ),
    );
  }

  void _finishPurchase(BuildContext context) {
    ProviderHelper.cartState(context).cleanCart();
    Navigator.of(context).pop();
  }
}
