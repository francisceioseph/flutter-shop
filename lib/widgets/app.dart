import 'package:flutter/material.dart';
import 'package:flutter_shop/config/app_router.dart';
import 'package:flutter_shop/models/state/app_state_model.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:flutter_shop/widgets/pages/main_page/main_page.dart';
import 'package:flutter_shop/widgets/themes/dark_theme.dart';
import 'package:flutter_shop/widgets/themes/light_theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateModel>(
          create: (context) => AppStateModel(),
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
          initialRoute: MainPage.namedRoute,
          onGenerateRoute: _router.onGenerateRoute,
        ),
      ),
    );
  }
}
