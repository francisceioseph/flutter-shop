import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/repositories/categories_repository.dart';
import 'package:flutter_shop/repositories/products_repository.dart';

class AppStateModel extends ChangeNotifier {
  CategoriesRepository _categoriesRepository = CategoriesRepository();
  ProductsRepository _productsRepository = ProductsRepository();

  Product _selectedProduct;
  List<Category> _categories = [];
  List<Product> _products = [];

  String _selectedCategoryId = '1';

  List<Category> get categories => _categories;
  List<Product> get products => _products;

  String get currentCategoryId => _selectedCategoryId;
  Product get currentProduct => _selectedProduct;
  Category get currentCategory =>
      _categories.firstWhere((c) => c.id == _selectedCategoryId);

  void selectCategory(String categoryId) {
    _selectedCategoryId = categoryId;
    notifyListeners();
  }

  void selectProduct(Product product) {
    _selectedProduct = product;
    notifyListeners();
  }

  void loadCategories() async {
    _categories = await _categoriesRepository.getCategories();
    notifyListeners();
  }

  void loadProducts() async {
    _products = await _productsRepository.getProducts(_selectedCategoryId);
    notifyListeners();
  }
}
