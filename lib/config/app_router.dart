import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/pages/landing_page.dart';
import 'package:flutter_shop/widgets/pages/login_page.dart';
import 'package:flutter_shop/widgets/pages/main_page/main_page.dart';
import 'package:flutter_shop/widgets/pages/product_page.dart';
import 'package:flutter_shop/widgets/pages/register_page.dart';

class AppRouter {
  MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        switch (settings.name) {
          case MainPage.routeName:
            return MainPage();

          case ProductPage.routeName:
            return ProductPage();

          case LoginPage.routeName:
            return LoginPage();

          case RegisterPage.routeName:
            return RegisterPage();

          default:
            return LandingPage();
        }
      },
    );
  }
}
