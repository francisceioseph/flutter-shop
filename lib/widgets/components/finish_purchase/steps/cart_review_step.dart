import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_page_list.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_total.dart';
import 'package:flutter_shop/widgets/components/simple_outline_button.dart';
import 'package:provider/provider.dart';

class CartReviewStep extends StatelessWidget {
  final void Function() onNextTap;

  const CartReviewStep({
    Key key,
    this.onNextTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<CartState>(
        builder: (context, model, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: CartPageList(cart: model)),
              CartTotalValue(cart: model),
              SimpleOutlineButton(
                margin: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                child: Text(
                  AppLocalizations.of(context).translate('next_button_text'),
                ),
                onPressed: onNextTap,
              )
            ],
          );
        },
      ),
    );
  }
}
