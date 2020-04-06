import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/login_form_controller.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/icon_form_text_field.dart';
import 'package:flutter_shop/widgets/components/outline_form_button.dart';
import 'package:flutter_shop/widgets/pages/main_page/main_page.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  LoginFormController _controller;

  String _email;
  String _password;

  @override
  void initState() {
    super.initState();

    _controller = LoginFormController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final _translator = AppLocalizations.of(context);

    return Form(
      key: _formKey,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              IconFormTextField(
                labelText: _translator.translate("email_label_text"),
                hintText: _translator.translate('email_hint_text'),
                leadingIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: _controller.validateEmail,
                onFieldSubmitted: _controller.onEmailFieldSubmitted,
                onFieldSaved: _onEmailFieldSaved,
              ),
              IconFormTextField(
                obscureText: true,
                labelText: _translator.translate('password_label_text'),
                hintText: _translator.translate('password_hint_text'),
                leadingIcon: Icons.lock,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                focusNode: _controller.passwordFocusNode,
                validator: _controller.validadePassword,
                onFieldSaved: _onPasswordFieldSaved,
              ),
              OutlineFormButton(
                text: _translator.translate('login_button_text'),
                onPressed: _onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onEmailFieldSaved(String value) {
    setState(() {
      _email = value;
    });
  }

  void _onPasswordFieldSaved(String value) {
    setState(() {
      _password = value;
    });
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Navigator.of(context).pushNamedAndRemoveUntil(
        MainPage.routeName,
        (_) => false,
        arguments: {
          'email': _email,
          'password': _password,
        },
      );
    }
  }
}
