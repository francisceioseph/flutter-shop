import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/pages/place_order_page.dart';

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
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(PlaceOrderPage.routeName);
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}
