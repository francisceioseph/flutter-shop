import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/pages/main_page/cart_tab.dart';
import 'package:flutter_shop/widgets/pages/main_page/categories_tab.dart';
import 'package:flutter_shop/widgets/pages/main_page/search_tab.dart';

class MainPage extends StatelessWidget {
  static const namedRoute = '/';

  final List<Widget> _tabViews = const [
    ProductsTab(),
    SearchTab(),
    CartTab(),
  ];

  final List<Widget> _tabs = const [
    Tab(
      icon: Icon(Icons.home),
      text: 'Categories',
    ),
    Tab(
      icon: Icon(Icons.search),
      text: 'Search',
    ),
    Tab(
      icon: Icon(Icons.shopping_cart),
      text: 'Cart',
    )
  ];

  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: _tabViews.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Store'),
        ),
        body: TabBarView(children: _tabViews),
        bottomNavigationBar: TabBar(
          tabs: _tabs,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Theme.of(context).accentColor,
          labelColor: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
