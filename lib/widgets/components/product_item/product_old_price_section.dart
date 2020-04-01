import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';

class ProductOldPriceSection extends StatelessWidget {
  final Product product;

  const ProductOldPriceSection({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;

    return Container(
      child: Visibility(
        visible: product.discount > 0,
        child: Text(
          'R\$ ${product.oldPrice}',
          style: textTheme.subhead.copyWith(
            fontWeight: FontWeight.w200,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ),
    );
  }
}
