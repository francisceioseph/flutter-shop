import 'package:flutter/material.dart';
import 'package:flutter_shop/services/validator.dart';

class PasswordTabFormController {
  final BuildContext context;
  final Validator _validator;

  PasswordTabFormController.of(BuildContext context)
      : context = context,
        _validator = Validator.of(context);

  final oldPasswordFocusNode = FocusNode();
  final newPasswordFocusNode = FocusNode();
  final newPasswordConfirmationFocusNode = FocusNode();

  String oldPasswordValidator(String value) {
    return _validator.validatePresence(value);
  }

  void oldPasswordSubmitted(String value) {
    _changeFocus(newPasswordConfirmationFocusNode);
  }

  String newPasswordValidator(String value) {
    return _validator.validatePresence(value);
  }

  void newPasswordSubmitted(String value) {
    _changeFocus(newPasswordConfirmationFocusNode);
  }

  String newPasswordConfirmationValidator(String value) {
    return _validator.validatePresence(value);
  }

  void _changeFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
