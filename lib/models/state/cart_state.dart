import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/cart_item.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/services/singleton.dart';
import 'package:rxdart/rxdart.dart';

class CartState extends ChangeNotifier {
  BehaviorSubject<Map<String, CartItem>> _cart = BehaviorSubject.seeded({});
  BehaviorSubject<Map<String, CartItem>> get cart => _cart;

  void getCart() {
    Singleton.cartRepository.getUserCart().listen((cart) => _cart.add(cart));
  }

  Stream<List<CartItem>> get cartItems {
    return _cart.map((Map<String, CartItem> cart) {
      final items = cart.values.toList();

      items.sort(
        (previous, current) =>
            previous.product.name.compareTo(current.product.name),
      );

      return items;
    });
  }

  Stream<double> get totalCartValue => _cart.map(
        (cart) => cart.values.fold(
          0.0,
          (double acc, CartItem cartItem) => acc + cartItem.subTotal,
        ),
      );

  void addProductToCart(Product product) {
    Singleton.cartRepository.addItemToCart(product.id);
  }

  void cleanCart() {
    Singleton.cartRepository.cleanCart();
  }
}
