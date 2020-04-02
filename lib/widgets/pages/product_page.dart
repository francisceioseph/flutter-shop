import 'package:flutter/material.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';
import 'package:flutter_shop/models/state/app_state_model.dart';
import 'package:flutter_shop/widgets/components/product_page/product_button.dart';
import 'package:flutter_shop/widgets/components/product_page/product_carousel.dart';
import 'package:flutter_shop/widgets/components/product_page/product_description.dart';
import 'package:flutter_shop/widgets/components/product_page/product_price.dart';
import 'package:flutter_shop/widgets/components/product_page/product_title.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  static const routeName = '/product-details';

  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Consumer<AppStateModel>(
          builder: (BuildContext context, AppStateModel model, _) {
            final product = model.currentProduct;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProductCarousel(
                  images: product.images,
                ),
                ProductTitle(
                  product: product,
                ),
                ProductPrice(
                  product: product,
                ),
                ProductDescription(
                  product: product,
                ),
                ProductButton(
                  text: 'Add to Cart',
                  onPressed: () {
                    ProviderHelper.appState(context).addProductToCart(product);
                    _showSnackBar(context, 'Product added to chart!');
                  },
                ),
                ProductButton(
                  text: 'Buy Now',
                  color: Theme.of(context).accentColor,
                  onPressed: () {},
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
