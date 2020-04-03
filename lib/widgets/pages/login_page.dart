import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/divider_text.dart';
import 'package:flutter_shop/widgets/components/login_page/login_form.dart';
import 'package:flutter_shop/widgets/components/login_page/login_social.dart';
import 'package:flutter_shop/widgets/pages/main_page/main_page.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'FlutterStore',
                  style: textTheme.title.copyWith(
                    fontSize: 32,
                  ),
                ),
                LoginForm(),
                DividerText(
                  text: 'OR',
                ),
                SocialLogin(
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
