import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/landing_page/landing_buttons.dart';
import 'package:flutter_shop/widgets/components/landing_page/landing_logo.dart';
import 'package:flutter_shop/widgets/pages/login_page.dart';
import 'package:flutter_shop/widgets/pages/register_page.dart';

class LandingPage extends StatelessWidget {
  static final routeName = '/';

  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              LandingLogo(),
              Expanded(
                child: Container(),
              ),
              LandingButtons(
                onLoginTap: () => _onLoginTap(context),
                onRegisterTap: () => _onRegisterTap(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onRegisterTap(BuildContext context) {
    Navigator.of(context).pushNamed(RegisterPage.routeName);
  }

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).pushNamed(LoginPage.routeName);
  }
}
