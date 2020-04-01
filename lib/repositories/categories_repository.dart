import 'package:flutter_shop/models/category.dart';

class CategoriesRepository {
  Future<List<Category>> getCategories() {
    return Future.value([
      Category(id: '1', name: 'All'),
      Category(id: '2', name: 'Clothing'),
      Category(id: '3', name: 'Accessories'),
      Category(id: '4', name: 'Home'),
    ]);
  }
}
