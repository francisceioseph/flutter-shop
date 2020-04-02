import 'package:flutter/material.dart';
import 'package:flutter_shop/helpers/validator_helpers.dart';

class LoginFormController {
  final BuildContext context;
  final passwordFocusNode = FocusNode();

  LoginFormController({
    @required this.context,
  });

  String validateEmail(String value) {
    if (value.isEmpty) {
      return "e-mail field can't be empty";
    } else if (!ValidatorHelper.validateEmail(value)) {
      return "invalid email";
    }

    return null;
  }

  void onEmailFieldSubmitted(String value) {
    _changeFocus(passwordFocusNode);
  }

  String validadePassword(String value) {
    if (value.isEmpty) {
      return "password field can't be empty";
    }

    return null;
  }

  void _changeFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
