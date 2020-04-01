import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_shop/models/product.dart';

class ProductsRepository {
  final _all = [
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
    Product(
      id: '3',
      name: 'Product 03',
      price: 1.22,
      categoryId: '3',
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
    Product(
      id: '4',
      name: 'Product 04',
      price: 1.22,
      categoryId: '3',
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
  ];

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
