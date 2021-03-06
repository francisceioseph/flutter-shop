import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final List<String> images;

  final double oldPrice;
  final double price;

  final String categoryId;

  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    this.categoryId,
    this.oldPrice = 0,
    this.description = '',
    this.images = const [],
  })  : assert(id != null),
        assert(name != null),
        assert(price != null);

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.documentID,
        name = snapshot.data['name'],
        description = snapshot.data['description'],
        images = <String>[...snapshot.data['images']],
        oldPrice = snapshot.data['oldPrice'].toDouble(),
        price = snapshot.data['price'].toDouble(),
        categoryId = snapshot.data['categoryId'];

  String get firstImage =>
      images.length > 0 ? images.first : 'https://picsum.photos/200';

  String get formattedPrice => 'R\$ ${price.toStringAsFixed(2)}';

  int get discount {
    if (oldPrice == 0) {
      return 0;
    }

    final diff = oldPrice - price;
    final percentage = 100 * diff / oldPrice;

    return percentage.round();
  }

  @override
  List<Object> get props => [id, name, price];
}
