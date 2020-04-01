import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';

class ProductPrice extends StatelessWidget {
  final Product product;

  const ProductPrice({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        left: 16,
        right: 16,
      ),
      child: Text(
        product.formattedPrice,
        style: Theme.of(context).primaryTextTheme.subtitle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
      ),
    );
  }
}
