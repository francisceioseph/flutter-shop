import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';

class ProductTitle extends StatelessWidget {
  final Product product;

  const ProductTitle({
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
      ),
      child: Row(
        children: <Widget>[
          Text(
            product.name,
            style:
                Theme.of(context).primaryTextTheme.title.copyWith(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
