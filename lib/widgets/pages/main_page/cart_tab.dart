import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_page_list.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_total.dart';
import 'package:flutter_shop/widgets/components/cart_page/finish_purchase_dialog.dart';
import 'package:provider/provider.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CartState>(
        builder: (BuildContext context, CartState state, _) {
          return Visibility(
            visible: state.cartItems.length > 0,
            child: Stack(
              children: <Widget>[
                CartPageList(),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 60,
                  child: CartTotalValue(),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: OutlineButton(
                    onPressed: () {
                      _showFinishPruchaseDialog(context);
                    },
                    child: Text('Finish Purchase'),
                  ),
                )
              ],
            ),
            replacement: Center(
              child: Text(
                'There is no item in your cart',
                style: Theme.of(context).primaryTextTheme.title,
              ),
            ),
          );
        },
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
