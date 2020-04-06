import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_view.dart';
import 'package:provider/provider.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CartState>(
        builder: (BuildContext context, CartState cart, _) {
          return Visibility(
            visible: cart.cartItems.length > 0,
            child: CartView(cart: cart),
            replacement: Center(
              child: Text(
                AppLocalizations.of(context).translate('empty_cart_text'),
                style: Theme.of(context).primaryTextTheme.title,
              ),
            ),
          );
        },
      ),
    );
  }
}
