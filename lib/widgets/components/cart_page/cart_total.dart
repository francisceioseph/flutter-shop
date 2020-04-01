import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/app_state_model.dart';
import 'package:provider/provider.dart';

class CartTotalValue extends StatelessWidget {
  const CartTotalValue({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.all(16),
      child: Consumer<AppStateModel>(
        builder: (context, model, _) {
          return Text(
            'Total: R\$ ${model.totalCartValue.toStringAsFixed(2)}',
            textAlign: TextAlign.right,
            style: Theme.of(context).primaryTextTheme.title,
          );
        },
      ),
    );
  }
}
