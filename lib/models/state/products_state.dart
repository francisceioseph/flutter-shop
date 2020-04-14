import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/services/singleton.dart';
import 'package:rxdart/rxdart.dart';

class ProductsState extends ChangeNotifier {
  BehaviorSubject<List<Product>> _products = BehaviorSubject();

  List<Product> _filteredProducts = [];
  Product _selectedProduct;

  Stream<List<Product>> get products => _products.stream;
  List<Product> get filteredProducts => _filteredProducts;

  Product get currentProduct => _selectedProduct;

  void selectProduct(Product product) {
    _selectedProduct = product;
    notifyListeners();
  }

  void loadProducts(String categoryId) {
    Singleton.productsRepository.getProducts(categoryId).listen(_products.add);
  }

  void filterProducts(String name) async {
    if (name == null || name.length == 0) {
      _filteredProducts = [];
    } else {
      _filteredProducts = await Singleton.productsRepository.findByName(name);
    }

    notifyListeners();
  }

  @override
  void dispose() {
    _products.close();
    super.dispose();
  }
}
