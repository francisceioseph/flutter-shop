import 'package:cloud_firestore/cloud_firestore.dart';
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

  Stream<List<Category>> loadCategories() {
    return Firestore.instance
        .collection('categories')
        .orderBy('name')
        .snapshots()
        .map(
          (QuerySnapshot snap) => snap.documents
              .map(
                (DocumentSnapshot snapshot) => Category.fromSnapshot(snapshot),
              )
              .toList(),
        );
  }
}
