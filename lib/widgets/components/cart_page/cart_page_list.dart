import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_list_item.dart';

class CartPageList extends StatelessWidget {
  final CartState cart;

  const CartPageList({
    Key key,
    @required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cart.cartItems.length,
      itemBuilder: (BuildContext context, int index) {
        return CartListItem(
          cartItem: cart.cartItems[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }
}
