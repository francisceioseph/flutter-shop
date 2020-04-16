import 'package:flutter_shop/repositories/auth_repository.dart';
import 'package:flutter_shop/repositories/cart_repository.dart';
import 'package:flutter_shop/repositories/categories_repository.dart';
import 'package:flutter_shop/repositories/products_repository.dart';

class Singleton {
  static final _categoriesRepository = CategoriesRepository();
  static final _productsRepository = ProductsRepository();
  static final _authRespository = AuthRepository();
  static final CartRepository _cartRepository = CartRepository();

  static CategoriesRepository get categoriesRepository => _categoriesRepository;
  static ProductsRepository get productsRepository => _productsRepository;
  static AuthRepository get authRepository => _authRespository;
  static CartRepository get cartRepository => _cartRepository;
}
