import 'package:flutter_shop/repositories/categories_repository.dart';
import 'package:flutter_shop/repositories/products_repository.dart';

class Singleton {
  static final _categoriesRepository = CategoriesRepository();
  static final _productsRepository = ProductsRepository();

  static CategoriesRepository get categoriesRepository => _categoriesRepository;
  static ProductsRepository get productsRepository => _productsRepository;
}
