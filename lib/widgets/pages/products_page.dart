import 'package:flutter/material.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';
import 'package:flutter_shop/models/state/app_state.dart';
import 'package:flutter_shop/widgets/components/product_item/product_item.dart';
import 'package:flutter_shop/widgets/components/staggered_grid.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  static const routeName = '/products';

  const ProductsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = ProviderHelper.appState(context);
    appState.loadProducts();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(appState.currentCategory?.name),
        ),
        body: Container(
          child: Consumer<AppState>(
            builder: (
              BuildContext context,
              AppState model,
              Widget child,
            ) {
              return StaggeredGrid(
                itemCount: model.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = model.products[index];
                  return ProductItem(product: product);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
