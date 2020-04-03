import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_page_list.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_total.dart';
import 'package:flutter_shop/widgets/components/cart_page/finish_purchase_dialog.dart';

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
            child: OutlineButton(
              color: Theme.of(context).accentColor,
              textColor: Theme.of(context).accentColor,
              borderSide: BorderSide(
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                _showFinishPruchaseDialog(context);
              },
              child: Text('Finish Purchase'),
            ),
          )
        ],
      ),
    );
  }

  void _showFinishPruchaseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return FinishPurchaseDialog();
      },
    );
  }
}
