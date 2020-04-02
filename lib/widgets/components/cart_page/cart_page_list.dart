import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:flutter_shop/widgets/components/cart_page/cart_list_item.dart';
import 'package:provider/provider.dart';

class CartPageList extends StatelessWidget {
  const CartPageList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (BuildContext context, CartState model, _) {
        return ListView.separated(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: model.cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            return CartListItem(
              cartItem: model.cartItems[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        );
      },
    );
  }
}
