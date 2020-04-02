import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/divider_text.dart';
import 'package:flutter_shop/widgets/components/login_page/login_form.dart';
import 'package:flutter_shop/widgets/components/login_page/login_social.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                LoginForm(),
                DividerText(
                  text: 'OR',
                ),
                SocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
