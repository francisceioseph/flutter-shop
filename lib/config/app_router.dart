import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/pages/main_page/main_page.dart';
import 'package:flutter_shop/widgets/pages/product_page.dart';
import 'package:flutter_shop/widgets/pages/products_page.dart';

class AppRouter {
  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        if (settings.name == ProductsPage.routeName) {
          return ProductsPage();
        }

        if (settings.name == ProductPage.routeName) {
          return ProductPage();
        }

        return MainPage();
      },
    );
  }
}
