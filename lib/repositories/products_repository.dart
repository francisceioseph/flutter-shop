import 'package:flutter_shop/models/product.dart';

class ProductsRepository {
  Future<List<Product>> getProducts(String categoryId) {
    final all = [
      Product(
        id: '1',
        name: 'Product 01',
        price: 0.5,
        categoryId: '2',
        oldPrice: 1,
        description: 'lorem ipsum dolor in si amet badiga...',
      ),
      Product(
        id: '2',
        name: 'Product 02',
        price: 1.22,
        categoryId: '2',
        description: 'lorem ipsum dolor in si amet badiga...',
      ),
      Product(
        id: '3',
        name: 'Product 03',
        price: 1.22,
        categoryId: '3',
        description: 'lorem ipsum dolor in si amet badiga...',
      ),
      Product(
        id: '4',
        name: 'Product 04',
        price: 1.22,
        categoryId: '3',
        description: 'lorem ipsum dolor in si amet badiga...',
      ),
    ];

    final List<Product> products = categoryId == '1'
        ? all
        : all.where((product) => product.categoryId == categoryId).toList();

    return Future.value(products);
  }
}
