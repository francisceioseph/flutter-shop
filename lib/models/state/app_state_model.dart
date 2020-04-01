import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/repositories/categories_repository.dart';
import 'package:flutter_shop/repositories/products_repository.dart';

class AppStateModel extends ChangeNotifier {
  CategoriesRepository _categoriesRepository = CategoriesRepository();
  ProductsRepository _productsRepository = ProductsRepository();

  List<Category> _categories = [];
  List<Product> _products = [];

  String _selectedCategoryId = '1';

  List<Category> get categories => this._categories;
  List<Product> get products => this._products;

  String get currentCategoryId => this._selectedCategoryId;
  Category get currentCategory =>
      _categories.firstWhere((c) => c.id == _selectedCategoryId);

  void selectCategory(String categoryId) {
    _selectedCategoryId = categoryId;
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
