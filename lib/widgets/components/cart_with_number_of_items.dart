import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/cart_item.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class CartWithNumberOfItems extends StatelessWidget {
  const CartWithNumberOfItems({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (context, model, child) {
        return StreamBuilder(
            stream: model.cart.stream,
            builder: (
              BuildContext context,
              AsyncSnapshot<Map<String, CartItem>> snapshot,
            ) {
              if (snapshot.hasData) {
                final cart = snapshot.data;
                final itemsLength = cart.keys.length;

                if (itemsLength > 0) {
                  return Badge(
                    elevation: 2,
                    child: child,
                    badgeContent: Text(
                      '$itemsLength',
                      style: Theme.of(context).primaryTextTheme.body1.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  );
                }

                return child;
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            });
      },
      child: Icon(LineIcons.shopping_cart),
    );
  }
}
