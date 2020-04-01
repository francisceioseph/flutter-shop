import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/product.dart';

class CartItem {
  final Product product;
  int amount;

  CartItem({
    @required this.product,
    this.amount = 0,
  });

  get subTotal => product.price * amount;
}
