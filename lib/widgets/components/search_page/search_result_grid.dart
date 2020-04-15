import 'package:flutter/material.dart';
import 'package:flutter_shop/models/product.dart';
import 'package:flutter_shop/models/state/products_state.dart';
import 'package:flutter_shop/widgets/components/product_item/product_item.dart';
import 'package:flutter_shop/widgets/components/staggered_grid.dart';
import 'package:provider/provider.dart';

class SearchResultGrid extends StatelessWidget {
  const SearchResultGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ProductsState>(
        builder: (context, model, _) {
          return StreamBuilder(
            stream: model.filteredProducts,
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasData) {
                final products = snapshot.data;

                return StaggeredGrid(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = products[index];
                    return ProductItem(product: product);
                  },
                );
              }

              return Center();
            },
          );
        },
      ),
    );
  }
}
