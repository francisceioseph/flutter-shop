import 'package:flutter/material.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';
import 'package:flutter_shop/models/state/main_page_state.dart';
import 'package:flutter_shop/models/state/products_state.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/product_page/product_button.dart';
import 'package:flutter_shop/widgets/components/product_page/product_carousel.dart';
import 'package:flutter_shop/widgets/components/product_page/product_description.dart';
import 'package:flutter_shop/widgets/components/product_page/product_price.dart';
import 'package:flutter_shop/widgets/components/product_page/product_title.dart';
import 'package:flutter_shop/widgets/pages/main_page/main_page.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  static const routeName = '/product-details';

  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Consumer<ProductsState>(
          builder: (BuildContext context, ProductsState model, _) {
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
                  text: translator.translate('add_to_chart_button_text'),
                  onPressed: () {
                    ProviderHelper.cartState(context).addProductToCart(product);
                    _showSnackBar(
                        context, translator.translate('product_addded_text'));
                  },
                ),
                ProductButton(
                  text: translator.translate('buy_button_text'),
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
    final snackbar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Go Home',
        onPressed: () {
          Provider.of<MainPageState>(context, listen: false).changeTabIndex(2);
          Navigator.of(context).pushNamedAndRemoveUntil(
            MainPage.routeName,
            (_) => false,
          );
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
