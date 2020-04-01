import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';

class ProductItemTitle extends StatelessWidget {
  final Product product;

  const ProductItemTitle({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;

    return Row(
      children: <Widget>[
        Text(
          'R\$ ${product.price}',
          style: textTheme.title.copyWith(
            fontSize: 20,
          ),
        ),
        if (product.discount > 0)
          Expanded(
            child: Text(
              '${product.discount}% OFF',
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
