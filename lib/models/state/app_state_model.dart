import 'package:flutter/material.dart';
import 'package:flutter_shop/models/cart_item.dart';
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
  List<Product> _filteredProducts = [];
  Map<String, CartItem> _cart = {};

  String _selectedCategoryId = '1';

  List<Category> get categories => _categories;
  List<Product> get products => _products;
  List<Product> get filteredProducts => _filteredProducts;
  Map<String, CartItem> get cart => _cart;

  String get currentCategoryId => _selectedCategoryId;
  Product get currentProduct => _selectedProduct;
  Category get currentCategory =>
      _categories.firstWhere((c) => c.id == _selectedCategoryId);

  List<CartItem> get cartItems {
    final items = _cart.values.toList();

    items.sort((previous, current) =>
        previous.product.name.compareTo(current.product.name));

    return items;
  }

  double get totalCartValue => _cart.values
      .fold(0.0, (double acc, CartItem cartItem) => acc + cartItem.subTotal);

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

  void filterProducts(String name) async {
    if (name == null || name.length == 0) {
      _filteredProducts = [];
    } else {
      _filteredProducts = await _productsRepository.findByName(name);
    }

    notifyListeners();
  }

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
