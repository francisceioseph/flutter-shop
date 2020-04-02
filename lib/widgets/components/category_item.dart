import 'package:flutter/material.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/widgets/pages/products_page.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: InkWell(
        onTap: () {
          final appState = ProviderHelper.appState(context);
          appState.selectCategory(category.id);

          Navigator.of(context).pushNamed(ProductsPage.routeName);
        },
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              ClipRRect(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.network(category.imageUrl),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  category.name,
                  style: Theme.of(context).primaryTextTheme.title,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
