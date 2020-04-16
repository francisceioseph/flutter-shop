import 'package:flutter_shop/repositories/auth_repository.dart';
import 'package:flutter_shop/repositories/cart_repository.dart';
import 'package:flutter_shop/repositories/categories_repository.dart';
import 'package:flutter_shop/repositories/products_repository.dart';
import 'package:flutter_shop/repositories/shipping_repository.dart';

class Singleton {
  static final _categoriesRepository = CategoriesRepository();
  static final _productsRepository = ProductsRepository();
  static final _authRespository = AuthRepository();
  static final _cartRepository = CartRepository();
  static final _shippingRepository = ShippingRepository();

  static CategoriesRepository get categoriesRepository => _categoriesRepository;
  static ProductsRepository get productsRepository => _productsRepository;
  static AuthRepository get authRepository => _authRespository;
  static CartRepository get cartRepository => _cartRepository;
  static ShippingRepository get shippingRepository => _shippingRepository;
}
