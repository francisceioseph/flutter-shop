import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_shop/config/app_router.dart';
import 'package:flutter_shop/models/state/app_state.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
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
        ChangeNotifierProvider<AppState>(
          create: (context) => AppState(),
        ),
        ChangeNotifierProvider<CartState>(
          create: (context) => CartState(),
        ),
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
