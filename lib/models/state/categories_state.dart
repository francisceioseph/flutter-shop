import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/services/singleton.dart';
import 'package:rxdart/rxdart.dart';

class CategoriesState extends ChangeNotifier {
  BehaviorSubject<List<Category>> _categories = BehaviorSubject();
  Category _category;

  Stream<List<Category>> get categories => _categories.stream;
  Category get category => _category;
  String get categoryId => _category != null ? _category.id : null;

  set category(Category category) {
    _category = category;
    notifyListeners();
  }

  loadCategories() {
    Singleton.categoriesRepository
        .loadCategories()
        .listen((list) => _categories.sink.add(list));
  }

  @override
  dispose() {
    _categories.close();

    super.dispose();
  }
}
