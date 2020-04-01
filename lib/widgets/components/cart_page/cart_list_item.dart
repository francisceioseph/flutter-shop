import 'package:flutter/material.dart';
import 'package:flutter_shop/models/cart_item.dart';

class CartListItem extends StatelessWidget {
  final CartItem cartItem;

  const CartListItem({
    Key key,
    @required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;

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
        subtitle: Text('Subtotal: R\$ ${cartItem.subTotal.toStringAsFixed(2)}'),
        trailing: Chip(
          label: Text('${cartItem.amount}'),
        ),
      ),
    );
  }
}
