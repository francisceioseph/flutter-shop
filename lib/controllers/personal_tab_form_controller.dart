import 'package:flutter/material.dart';
import 'package:flutter_shop/models/personal_information.dart';
import 'package:flutter_shop/services/validator.dart';

class PersonalTabFormController {
  final PersonalInformation personalInformation;
  final BuildContext context;
  final Validator _validator;

  PersonalTabFormController({
    @required this.context,
    this.personalInformation,
  }) : _validator = Validator.of(context);

  final nameFocusNode = FocusNode();
  final birthDateFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

  String nameValidator(String value) {
    return _validator.validatePresence(value);
  }

  void nameSubmitted(String value) {
    _changeFocus(birthDateFocusNode);
  }

  String birthDateValidator(String value) {
    return _validator.validatePresence(value);
  }

  void birthDateSubmitted(String value) {
    _changeFocus(emailFocusNode);
  }

  String emailValidator(String value) {
    return _validator.validatePresence(value);
  }

  void emailSubmitted(String value) {
    _changeFocus(phoneFocusNode);
  }

  String phoneValidator(String value) {
    return _validator.validatePresence(value);
  }

  void _changeFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
