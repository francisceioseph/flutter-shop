import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_shop/models/product.dart';

class ProductsRepository {
  final _all = List.generate(
    400,
    (int index) => Product(
      id: '$index',
      name: 'Product 0$index',
      price: 0.5,
      categoryId: '${(index / 4) + 1}',
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
      ],
    ),
  );

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
