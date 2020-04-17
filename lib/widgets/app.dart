import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_shop/config/app_router.dart';
import 'package:flutter_shop/models/state/credit_card_state.dart';
import 'package:flutter_shop/models/state/products_state.dart';
import 'package:flutter_shop/models/state/auth_state.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:flutter_shop/models/state/categories_state.dart';
import 'package:flutter_shop/models/state/shipping_state.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/pages/landing_page.dart';
import 'package:flutter_shop/widgets/themes/dark_theme.dart';
import 'package:flutter_shop/widgets/themes/light_theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductsState>(
          create: (context) => ProductsState(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesState(),
        ),
        ChangeNotifierProvider<CartState>(
          create: (context) => CartState(),
        ),
        ChangeNotifierProvider<AuthState>(
          create: (context) => AuthState(),
        ),
        Provider(
          create: (context) => ShippingState(),
        ),
        Provider(
          create: (context) => CreditCardState(),
        )
      ],
      child: Container(
        child: MaterialApp(
          title: 'Flutter Shop',
          theme: kAppLightTheme,
          darkTheme: kAppDarkTheme,
          initialRoute: LandingPage.routeName,
          onGenerateRoute: _router.onGenerateRoute,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('pt', 'BR'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
