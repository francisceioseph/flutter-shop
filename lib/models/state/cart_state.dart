import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/cart_item.dart';
import 'package:flutter_shop/models/product.dart';

class CartState extends ChangeNotifier {
  Map<String, CartItem> _cart = {};

  Map<String, CartItem> get cart => _cart;

  List<CartItem> get cartItems {
    final items = _cart.values.toList();

    items.sort((previous, current) =>
        previous.product.name.compareTo(current.product.name));

    return items;
  }

  double get totalCartValue => _cart.values.fold(
        0.0,
        (double acc, CartItem cartItem) => acc + cartItem.subTotal,
      );

  void addProductToCart(Product product) {
    final item = _cart[product.id];

    if (item != null) {
      _cart[product.id].amount++;
    } else {
      _cart[product.id] = CartItem(product: product, amount: 1);
    }

    notifyListeners();
  }

  void cleanCart() {
    _cart = {};
    notifyListeners();
  }
}
