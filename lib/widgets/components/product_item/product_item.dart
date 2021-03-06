import 'package:flutter/material.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/widgets/components/cached_image.dart';
import 'package:flutter_shop/widgets/components/product_item/product_name_section.dart';
import 'package:flutter_shop/widgets/components/product_item/product_old_price_section.dart';
import 'package:flutter_shop/widgets/components/product_item/product_price_section.dart';
import 'package:flutter_shop/widgets/pages/product_page.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: () {
          ProviderHelper.productsState(context).selectProduct(product);
          Navigator.of(context).pushNamed(ProductPage.routeName);
        },
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
                  child: CachedImage(url: product.firstImage),
                ),
              ),
              ProductOldPriceSection(
                product: product,
              ),
              ProductPriceSection(
                product: product,
              ),
              ProductNameSection(
                product: product,
              )
            ],
          ),
        ),
      ),
    );
  }
}
