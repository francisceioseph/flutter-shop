import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:provider/provider.dart';

class CartWithNumberOfItems extends StatelessWidget {
  const CartWithNumberOfItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (context, model, child) {
        final itemsLength = model.cart.keys.length;

        if (itemsLength > 0) {
          return Badge(
            elevation: 2,
            child: child,
            badgeContent: Text('$itemsLength'),
          );
        }

        return child;
      },
      child: Icon(Icons.shopping_cart),
    );
  }
}
