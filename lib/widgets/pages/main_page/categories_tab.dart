import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/app_state_model.dart';
import 'package:flutter_shop/widgets/components/category_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({Key key}) : super(key: key);

  @override
  _CategoriesTabState createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<ProductsTab> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = Provider.of<AppStateModel>(context, listen: false);
    provider.loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(
      builder: (
        BuildContext context,
        AppStateModel model,
        Widget widget,
      ) {
        return StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: model.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryItem(
              category: model.categories[index],
            );
          },
          staggeredTileBuilder: (int index) {
            return StaggeredTile.fit(2);
          },
        );
      },
    );
  }
}
