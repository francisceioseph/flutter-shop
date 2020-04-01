import 'package:flutter_lorem/flutter_lorem.dart';
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
          description: lorem(paragraphs: 4, words: 200),
          images: [
            'https://picsum.photos/200',
            'https://picsum.photos/200',
            'https://picsum.photos/200',
            'https://picsum.photos/200',
            'https://picsum.photos/200',
            'https://picsum.photos/200',
            'https://picsum.photos/200',
          ]),
      Product(
        id: '2',
        name: 'Product 02',
        price: 1.22,
        categoryId: '2',
        description: lorem(paragraphs: 4, words: 200),
      ),
      Product(
        id: '3',
        name: 'Product 03',
        price: 1.22,
        categoryId: '3',
        description: lorem(paragraphs: 4, words: 200),
      ),
      Product(
        id: '4',
        name: 'Product 04',
        price: 1.22,
        categoryId: '3',
        description: lorem(paragraphs: 4, words: 200),
      ),
    ];

    final List<Product> products = categoryId == '1'
        ? all
        : all.where((product) => product.categoryId == categoryId).toList();

    return Future.value(products);
  }
}
