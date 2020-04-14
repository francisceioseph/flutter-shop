import 'package:flutter/material.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/services/singleton.dart';
import 'package:flutter_shop/widgets/components/divider_text.dart';
import 'package:flutter_shop/widgets/components/login_page/login_form.dart';
import 'package:flutter_shop/widgets/components/social_sign_in.dart';
import 'package:flutter_shop/widgets/pages/main_page/main_page.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;
    final translatorManager = AppLocalizations.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            translatorManager.translate('login_app_bar'),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  translatorManager.translate('app_title'),
                  style: textTheme.title.copyWith(
                    fontSize: 32,
                  ),
                ),
                LoginForm(),
                DividerText(
                  text: translatorManager.translate('login_or_text'),
                ),
                SocialSignIn(
                  onGoogleTap: () => _googleSignIn(context),
                  onFacebookTap: () => _goToMainPage(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _googleSignIn(BuildContext context) async {
    try {
      await Singleton.authRepository.signInWithGoogle();
      _goToMainPage(context);
    } catch (e) {
      print(e);
    }
  }

  void _goToMainPage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainPage.routeName,
      (_) => false,
    );
  }
}
