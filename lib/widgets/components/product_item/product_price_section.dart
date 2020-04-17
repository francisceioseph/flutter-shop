import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';

class ProductPriceSection extends StatelessWidget {
  final Product product;

  const ProductPriceSection({
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
              style: Theme.of(context)
                  .accentTextTheme
                  .subtitle
                  .copyWith(color: Colors.lightGreen),
            ),
          ),
      ],
    );
  }
}
