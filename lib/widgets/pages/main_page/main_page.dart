import 'package:flutter/material.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/pages/main_page/cart_tab.dart';
import 'package:flutter_shop/widgets/pages/main_page/categories_tab.dart';
import 'package:flutter_shop/widgets/pages/main_page/search_tab.dart';

class MainPage extends StatelessWidget {
  static const routeName = '/home';

  final List<Widget> _tabViews = const [
    ProductsTab(),
    SearchTab(),
    CartTab(),
  ];

  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);

    final List<Widget> tabs = [
      Tab(
        icon: Icon(Icons.home),
        text: translator.translate("categories_tab_text"),
      ),
      Tab(
        icon: Icon(Icons.search),
        text: translator.translate("search_tab_text"),
      ),
      Tab(
        icon: Icon(Icons.shopping_cart),
        text: translator.translate("cart_tab_text"),
      )
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: _tabViews.length,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              translator.translate('app_title'),
            ),
          ),
          body: TabBarView(children: _tabViews),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(
              right: 8,
              left: 8,
              bottom: 4,
            ),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: TabBar(
                tabs: tabs,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Theme.of(context).accentColor,
                labelColor: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
