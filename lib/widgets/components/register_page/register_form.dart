import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/register_form_controller.dart';
import 'package:flutter_shop/widgets/components/icon_form_text_field.dart';
import 'package:flutter_shop/widgets/components/outline_form_button.dart';
import 'package:flutter_shop/widgets/pages/main_page/main_page.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterFormController _controller;

  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _passwordConfirmation;

  @override
  void initState() {
    _controller = RegisterFormController(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconFormTextField(
                labelText: 'First Name',
                hintText: 'Your first name',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: _controller.firstNameFocusNode,
                validator: _controller.validateFirstName,
                onFieldSubmitted: _controller.onFirstNameSubmitted,
                onFieldSaved: _onFirstNameSaved,
              ),
              IconFormTextField(
                labelText: 'Last Name',
                hintText: 'Your last name',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: _controller.lastNameFocusNode,
                validator: _controller.validateLastName,
                onFieldSubmitted: _controller.onLastNameSubmitted,
                onFieldSaved: _onLastNameSaved,
              ),
              IconFormTextField(
                labelText: 'E-mail',
                hintText: 'Your e-mail address',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: _controller.emailFocusNode,
                validator: _controller.validateEmail,
                onFieldSubmitted: _controller.onEmailFieldSubmitted,
                onFieldSaved: _onEmailFieldSaved,
              ),
              IconFormTextField(
                obscureText: true,
                hintText: 'Your password',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: _controller.passwordFocusNode,
                validator: _controller.validadePassword,
                onFieldSubmitted: _controller.onPasswordSubmitted,
                onFieldSaved: _onPasswordFieldSaved,
              ),
              IconFormTextField(
                obscureText: true,
                labelText: 'Password Confirmation',
                hintText: 'Your password confirmation address',
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                focusNode: _controller.passwordConfirmationFocusNode,
                validator: _controller.validadePasswordConfirmation,
                onFieldSaved: _onPasswordConfirmationFieldSaved,
              ),
              OutlineFormButton(
                text: 'log in',
                onPressed: _onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onFirstNameSaved(String value) {
    setState(() {
      _firstName = value;
    });
  }

  void _onLastNameSaved(String value) {
    setState(() {
      _lastName = value;
    });
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

  void _onPasswordConfirmationFieldSaved(String value) {
    setState(() {
      _passwordConfirmation = value;
    });
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Navigator.of(context).pushNamedAndRemoveUntil(
          MainPage.routeName, (_) => false,
          arguments: {
            _firstName,
            _lastName,
            _email,
            _password,
            _passwordConfirmation,
          });
    }
  }
}
