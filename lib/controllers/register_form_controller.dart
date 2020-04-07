import 'package:flutter/material.dart';
import 'package:flutter_shop/services/validator.dart';

class RegisterFormController {
  final BuildContext context;
  final Validator _validator;

  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final passwordConfirmationFocusNode = FocusNode();

  RegisterFormController.of(BuildContext context)
      : context = context,
        _validator = Validator.of(context);

  String validateFirstName(String value) {
    return _validator.validatePresence(value);
  }

  void onFirstNameSubmitted(String value) {
    _changeFocus(lastNameFocusNode);
  }

  String validateLastName(String value) {
    return _validator.validatePresence(value);
  }

  void onLastNameSubmitted(String value) {
    _changeFocus(emailFocusNode);
  }

  String validateEmail(String value) {
    return _validator.validateEmail(value);
  }

  void onEmailFieldSubmitted(String value) {
    _changeFocus(passwordFocusNode);
  }

  String validadePassword(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }

    return null;
  }

  void onPasswordSubmitted(String value) {
    _changeFocus(passwordConfirmationFocusNode);
  }

  String validadePasswordConfirmation(String value) {
    if (value.isEmpty) {
      return "This field can't be empty";
    }

    return null;
  }

  void _changeFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
