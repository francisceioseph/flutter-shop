import 'package:flutter/material.dart';
import 'package:flutter_shop/models/cart_item.dart';
import 'package:flutter_shop/services/app_localizations.dart';

class CartListItem extends StatelessWidget {
  final CartItem cartItem;

  const CartListItem({
    Key key,
    @required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;
    final translator = AppLocalizations.of(context);

    return Container(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Image.network(cartItem.product.firstImage),
        ),
        title: Text(
          cartItem.product.name,
          style: textTheme.title,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                '${translator.translate('cart_unit_price_text')} ${cartItem.product.price}'),
            Container(
              margin: EdgeInsets.only(
                top: 8,
                bottom: 8,
              ),
              child: Text(
                'Subtotal: R\$ ${cartItem.subTotal.toStringAsFixed(2)}',
                style: Theme.of(context).primaryTextTheme.subhead,
              ),
            ),
          ],
        ),
        trailing: Chip(
          label: Text('${cartItem.amount}'),
        ),
      ),
    );
  }
}
