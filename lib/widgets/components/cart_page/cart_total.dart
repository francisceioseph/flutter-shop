import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/cart_state.dart';

class CartTotalValue extends StatelessWidget {
  final CartState cart;

  const CartTotalValue({Key key, @required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: cart.totalCartValue,
      builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
        if (snapshot.hasData) {
          final value = snapshot.data;
          return Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.all(16),
            child: Text(
              'Total: R\$ ${value.toStringAsFixed(2)}',
              textAlign: TextAlign.right,
              style: Theme.of(context).primaryTextTheme.title,
            ),
          );
        }

        return LinearProgressIndicator();
      },
    );
  }
}
