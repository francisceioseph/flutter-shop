import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';

class ProductNameSection extends StatelessWidget {
  final Product product;

  const ProductNameSection({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;

    return Container(
      child: Text(
        product.name,
        style: textTheme.subtitle.copyWith(
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
