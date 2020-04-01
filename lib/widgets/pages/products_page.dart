import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/app_state_model.dart';
import 'package:flutter_shop/widgets/components/product_item/product_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  static const routeName = '/products';

  const ProductsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateModel>(context, listen: false);
    appState.loadProducts();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(appState.currentCategory?.name),
        ),
        body: Container(
          child: Consumer<AppStateModel>(
            builder: (
              BuildContext context,
              AppStateModel model,
              Widget child,
            ) {
              return StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                itemCount: model.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = model.products[index];
                  return ProductItem(product: product);
                },
                staggeredTileBuilder: (int index) {
                  return StaggeredTile.fit(2);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
