import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_page_list.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_total.dart';
import 'package:flutter_shop/widgets/components/cart_page/finish_purchase_dialog.dart';

class CartTab extends StatelessWidget {
  const CartTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
