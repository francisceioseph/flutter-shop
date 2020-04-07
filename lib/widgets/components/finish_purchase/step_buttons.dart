import 'package:flutter/material.dart';
import 'package:flutter_shop/services/app_localizations.dart';

class StepButtons extends StatelessWidget {
  final void Function() onNextTap;
  final void Function() onBackTap;

  final String nextButtonText;

  const StepButtons({
    Key key,
    this.onNextTap,
    this.onBackTap,
    this.nextButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);

    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(8),
            child: FloatingActionButton(
              child: Icon(Icons.arrow_back),
              onPressed: onBackTap,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(8),
              child: FloatingActionButton(
                isExtended: true,
                child: Text(
                  this.nextButtonText ??
                      translator.translate('next_button_text'),
                ),
                onPressed: onNextTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
