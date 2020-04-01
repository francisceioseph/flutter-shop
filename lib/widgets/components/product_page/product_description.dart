import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';

class ProductDescription extends StatelessWidget {
  final Product product;

  const ProductDescription({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Text(
        product.description,
        style: Theme.of(context)
            .primaryTextTheme
            .body1
            .copyWith(fontWeight: FontWeight.w300),
      ),
    );
  }
}
