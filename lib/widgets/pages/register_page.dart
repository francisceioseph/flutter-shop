import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/divider_text.dart';
import 'package:flutter_shop/widgets/components/register_page/register_form.dart';
import 'package:flutter_shop/widgets/components/register_page/register_social.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/register';

  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
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
                RegisterForm(),
                DividerText(
                  text: 'OR',
                ),
                RegisterSocial(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
