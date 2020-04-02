import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/landing_page/landing_logo.dart';
import 'package:flutter_shop/widgets/components/landing_page/landing_page_footer.dart';
import 'package:flutter_shop/widgets/components/landing_page/landing_register_button.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const LandingLogo(),
              LandingRegisterButton(
                onPressed: () => _registerPressedHandler(context),
              ),
              LandingPageFooter(
                onLoginButtonPressed: () => _loginPressedHandler(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _registerPressedHandler(BuildContext context) {
    Navigator.of(context).pushNamed(RegisterPage.routeName);
  }

  void _loginPressedHandler(BuildContext context) {
    Navigator.of(context).pushNamed(LoginPage.routeName);
  }
}
