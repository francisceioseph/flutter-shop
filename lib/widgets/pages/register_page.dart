import 'package:flutter/material.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/divider_text.dart';
import 'package:flutter_shop/widgets/components/register_page/register_form.dart';
import 'package:flutter_shop/widgets/components/register_page/register_social.dart';
import 'package:flutter_shop/widgets/pages/main_page/main_page.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/register';

  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;
    final translator = AppLocalizations.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            translator.translate('register_app_bar'),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  translator.translate('app_title'),
                  style: textTheme.title.copyWith(
                    fontSize: 32,
                  ),
                ),
                RegisterForm(),
                DividerText(
                  text: translator.translate('login_or_text'),
                ),
                RegisterSocial(
                  onGoogleTap: () => _goToMainPage(context),
                  onFacebookTap: () => _goToMainPage(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _goToMainPage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainPage.routeName,
      (_) => false,
    );
  }
}
