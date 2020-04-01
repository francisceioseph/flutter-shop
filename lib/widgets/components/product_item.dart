import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/widgets/components/product_item_title.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.network(product.firstImage),
              ),
            ),
            if (product.oldPrice > 0)
              Text(
                'R\$ ${product.oldPrice}',
                style: Theme.of(context).primaryTextTheme.subhead.copyWith(
                      fontWeight: FontWeight.w200,
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
            ProductItemTitle(
              product: product,
            ),
            Text(
              product.name,
              style: textTheme.subtitle.copyWith(
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
