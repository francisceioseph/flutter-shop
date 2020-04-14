import 'package:flutter/material.dart';
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
          return StaggeredGrid(
            itemCount: model.filteredProducts.length,
            itemBuilder: (BuildContext context, int index) {
              final product = model.filteredProducts[index];
              return ProductItem(product: product);
            },
          );
        },
      ),
    );
  }
}
