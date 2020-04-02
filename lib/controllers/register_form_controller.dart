import 'package:flutter/material.dart';
import 'package:flutter_shop/helpers/validator_helpers.dart';

class RegisterFormController {
  final BuildContext context;

  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final passwordConfirmationFocusNode = FocusNode();

  RegisterFormController({
    @required this.context,
  });

  String validateFirstName(String value) {
    return ValidatorHelper.validatePresence(value);
  }

  void onFirstNameSubmitted(String value) {
    _changeFocus(lastNameFocusNode);
  }

  String validateLastName(String value) {
    return ValidatorHelper.validatePresence(value);
  }

  void onLastNameSubmitted(String value) {
    _changeFocus(emailFocusNode);
  }

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

  void onPasswordSubmitted(String value) {
    _changeFocus(passwordConfirmationFocusNode);
  }

  String validadePasswordConfirmation(String value) {
    if (value.isEmpty) {
      return "password confirmation field can't be empty";
    }

    return null;
  }

  void _changeFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
