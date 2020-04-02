import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/cart_state.dart';

class CartTotalValue extends StatelessWidget {
  final CartState cart;

  const CartTotalValue({Key key, @required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.all(16),
      child: Text(
        'Total: R\$ ${cart.totalCartValue.toStringAsFixed(2)}',
        textAlign: TextAlign.right,
        style: Theme.of(context).primaryTextTheme.title,
      ),
    );
  }
}
