import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:rxdart/rxdart.dart';

class ProductsRepository {
  Stream<List<Product>> getProducts(String categoryId) {
    return Firestore.instance
        .collection('categories')
        .document(categoryId)
        .snapshots()
        .switchMap(
      (DocumentSnapshot snapshot) {
        final Map<String, dynamic> products = snapshot.data['products'] ?? {};

        final streams = products.keys.map((String id) {
          return Firestore.instance
              .collection('products')
              .document(id)
              .snapshots()
              .map(
                (DocumentSnapshot snapshot) => Product.fromSnapshot(snapshot),
              );
        }).toList();

        return Rx.combineLatestList(streams);
      },
    ).map(
      (products) => [...products]..sort((a, b) => a.name.compareTo(b.name)),
    );
  }

  Stream<List<Product>> findByName(String name) {
    final lowerName = name.toLowerCase();

    return Firestore.instance
        .collection('products')
        .orderBy('name')
        .snapshots()
        .map(
          (query) => query.documents
              .where((snap) {
                String name = snap.data['name'];
                return name.toLowerCase().contains(lowerName);
              })
              .map(
                (snapshot) => Product.fromSnapshot(snapshot),
              )
              .toList(),
        );
  }
}
