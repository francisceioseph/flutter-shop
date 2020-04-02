import 'package:flutter/material.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';

class FinishPurchaseDialog extends StatelessWidget {
  const FinishPurchaseDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Success'),
      content: Text('Purchase finished successfully!'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            _cleanCart(context);
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  }

  void _cleanCart(BuildContext context) {
    ProviderHelper.appState(context).cleanCart();
  }
}
