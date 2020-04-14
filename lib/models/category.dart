import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  Category({
    @required this.id,
    @required this.name,
    this.imageUrl = 'https://picsum.photos/200',
    this.description,
  })  : assert(id != null),
        assert(name != null);

  Category.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.documentID,
        name = snapshot.data['name'],
        description = snapshot.data['description'],
        imageUrl = snapshot.data['imageUrl'];

  @override
  List<Object> get props => [id, name];
}
