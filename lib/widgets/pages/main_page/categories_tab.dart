import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/models/state/categories_state.dart';
import 'package:flutter_shop/widgets/components/category_item.dart';
import 'package:flutter_shop/widgets/components/staggered_grid.dart';
import 'package:provider/provider.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesState>(
      builder: (
        BuildContext context,
        CategoriesState state,
        Widget widget,
      ) {
        return StreamBuilder(
          stream: state.categories,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Category>> snapshot,
          ) {
            if (snapshot.hasData) {
              final categories = snapshot.data;

              return StaggeredGrid(
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryItem(
                    category: categories[index],
                  );
                },
              );
            }

            state.loadCategories();
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
