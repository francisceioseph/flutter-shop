import 'dart:math';

import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_shop/models/product.dart';

class ProductsRepository {
  static final _rnd = Random.secure();

  final _all = List.generate(
    400,
    (int index) => Product(
      id: '$index',
      name: 'Product 0$index',
      price: _getRandomPrice(),
      oldPrice: _getRandomPrice(),
      categoryId: '${(index % 4) + 1}',
      description: lorem(paragraphs: 4, words: 200),
      images: [
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
        'https://picsum.photos/200',
      ],
    ),
  );

  static double _getRandomPrice() {
    final p1 = 1 - _rnd.nextDouble();
    final p2 = p1 * pow(10, _rnd.nextInt(3));
    final p3 = double.parse(p2.toStringAsFixed(2));

    return p3;
  }

  Future<List<Product>> getProducts(String categoryId) async {
    return categoryId == '1'
        ? _all
        : _all.where((product) => product.categoryId == categoryId).toList();
  }

  Future<List<Product>> findByName(String name) async {
    final lowerName = name.toLowerCase();

    return _all.where((p) => p.name.toLowerCase().contains(lowerName)).toList();
  }
}
