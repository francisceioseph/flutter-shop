import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_page_list.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_total.dart';
import 'package:flutter_shop/widgets/components/simple_outline_button.dart';
import 'package:flutter_shop/widgets/pages/place_order_page.dart';

class CartView extends StatelessWidget {
  final CartState cart;

  const CartView({
    Key key,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          CartPageList(
            cart: cart,
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 60,
            child: CartTotalValue(
              cart: cart,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: SimpleOutlineButton(
              onPressed: () {
                Navigator.pushNamed(context, PlaceOrderPage.routeName);
              },
              child: Text(
                AppLocalizations.of(context).translate('finish_purchase_text'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
