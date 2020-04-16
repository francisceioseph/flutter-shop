import 'package:flutter/material.dart';
import 'package:flutter_shop/models/cart_item.dart';
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
    return StreamBuilder(
      stream: cart.cartItems,
      builder: (BuildContext context, AsyncSnapshot<List<CartItem>> snaphot) {
        if (snaphot.hasData) {
          final items = snaphot.data;

          return ListView.separated(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return CartListItem(
                cartItem: items[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
