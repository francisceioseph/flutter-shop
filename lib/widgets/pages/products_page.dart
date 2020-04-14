import 'package:flutter/material.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/models/state/products_state.dart';
import 'package:flutter_shop/widgets/components/cart_with_number_of_items.dart';
import 'package:flutter_shop/widgets/components/product_item/product_item.dart';
import 'package:flutter_shop/widgets/components/staggered_grid.dart';
import 'package:flutter_shop/widgets/pages/main_page/main_page.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  static const routeName = '/products';

  const ProductsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryState = ProviderHelper.categoriesState(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryState.category?.name),
          actions: <Widget>[
            Builder(builder: (BuildContext context) {
              return IconButton(
                icon: CartWithNumberOfItems(),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    MainPage.routeName,
                    (_) => false,
                  );
                },
              );
            }),
          ],
        ),
        body: Container(
          child: Consumer<ProductsState>(
            builder: (
              BuildContext context,
              ProductsState productsState,
              Widget child,
            ) {
              return StreamBuilder(
                stream: productsState.products,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<Product>> snapshot,
                ) {
                  if (snapshot.hasData) {
                    return StaggeredGrid(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = snapshot.data[index];
                        return ProductItem(product: product);
                      },
                    );
                  }

                  productsState.loadProducts(categoryState.categoryId);

                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
