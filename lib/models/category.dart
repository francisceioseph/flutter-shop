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

  @override
  List<Object> get props => [id, name];
}
