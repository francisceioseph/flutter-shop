import 'package:flutter/material.dart';
import 'package:flutter_shop/models/shipping.dart';
import 'package:flutter_shop/services/validator.dart';

class ShippingFormController {
  final BuildContext context;
  final Validator _validator;

  final fullNameFocusNode = FocusNode();
  final addressFocusNode = FocusNode();
  final countryFocusNode = FocusNode();

  final stateFocusNode = FocusNode();
  final cityFocusNode = FocusNode();
  final zipFocusNode = FocusNode();

  final data = Shipping();

  ShippingFormController.of(BuildContext context)
      : assert(context != null),
        context = context,
        _validator = Validator.of(context);

  String fullNameValidator(String value) {
    return _validator.validatePresence(value);
  }

  void fullNameSubmitted(String value) {
    _changeFocus(addressFocusNode);
  }

  String addressValidator(String value) {
    return _validator.validatePresence(value);
  }

  void addressSubmitted(String value) {
    _changeFocus(countryFocusNode);
  }

  String countryValidator(String value) {
    return _validator.validatePresence(value);
  }

  void countrySubmitted(String value) {
    _changeFocus(stateFocusNode);
  }

  String stateValidator(String value) {
    return _validator.validatePresence(value);
  }

  void stateSubmitted(String value) {
    _changeFocus(cityFocusNode);
  }

  String cityValidator(String value) {
    return _validator.validatePresence(value);
  }

  void citySubmitted(String value) {
    _changeFocus(zipFocusNode);
  }

  String zipValidator(String value) {
    return _validator.validatePresence(value);
  }

  void zipSubmitted(String value) {}

  void _changeFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
