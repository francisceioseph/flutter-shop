import 'package:flutter/material.dart';
import 'package:flutter_shop/services/validator.dart';

class LoginFormController {
  final BuildContext context;
  final Validator _validator;

  final passwordFocusNode = FocusNode();

  LoginFormController.of(BuildContext context)
      : context = context,
        _validator = Validator.of(context);

  String validateEmail(String value) {
    return _validator.validateEmail(value);
  }

  void onEmailFieldSubmitted(String value) {
    _changeFocus(passwordFocusNode);
  }

  String validadePassword(String value) {
    return _validator.validatePresence(value);
  }

  void _changeFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
