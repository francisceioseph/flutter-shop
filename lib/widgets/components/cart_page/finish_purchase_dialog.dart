import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/models/state/app_state_model.dart';

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
    Provider.of<AppStateModel>(context, listen: false).cleanCart();
  }
}
