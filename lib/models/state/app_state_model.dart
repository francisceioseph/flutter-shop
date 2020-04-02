import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/services/singleton.dart';

class AppStateModel extends ChangeNotifier {
  Product _selectedProduct;
  List<Category> _categories = [];
  List<Product> _products = [];
  List<Product> _filteredProducts = [];

  String _selectedCategoryId = '1';

  List<Category> get categories => _categories;
  List<Product> get products => _products;
  List<Product> get filteredProducts => _filteredProducts;

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
    _categories = await Singleton.categoriesRepository.getCategories();
    notifyListeners();
  }

  void loadProducts() async {
    _products =
        await Singleton.productsRepository.getProducts(_selectedCategoryId);
    notifyListeners();
  }

  void filterProducts(String name) async {
    if (name == null || name.length == 0) {
      _filteredProducts = [];
    } else {
      _filteredProducts = await Singleton.productsRepository.findByName(name);
    }

    notifyListeners();
  }
}
