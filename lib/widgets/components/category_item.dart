import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/models/state/app_state_model.dart';
import 'package:flutter_shop/widgets/pages/products_page.dart';
import 'package:provider/provider.dart';

class CategoryListItem extends StatelessWidget {
  final Category category;

  const CategoryListItem({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(8),
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(category.imageUrl),
      ),
      title: Text(
        category.name,
        style:
            Theme.of(context).primaryTextTheme.subhead.copyWith(fontSize: 18),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        final state = Provider.of<AppStateModel>(
          context,
          listen: false,
        );
        state.selectCategory(category.id);

        Navigator.of(context).pushNamed(ProductsPage.routeName);
      },
    );
  }
}
