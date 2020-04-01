import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/app_state_model.dart';
import 'package:flutter_shop/widgets/components/product_item/product_item.dart';
import 'package:flutter_shop/widgets/components/staggered_grid.dart';
import 'package:provider/provider.dart';

class SearchResultGrid extends StatelessWidget {
  const SearchResultGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<AppStateModel>(
        builder: (context, model, _) {
          return StaggeredGrid(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
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
