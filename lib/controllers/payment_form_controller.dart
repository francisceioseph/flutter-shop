import 'package:flutter/material.dart';
import 'package:flutter_shop/models/credit_card.dart';
import 'package:flutter_shop/services/validator.dart';

class PaymentFormController {
  final userCardNameFocusNode = FocusNode();
  final cardNumberFocusNode = FocusNode();
  final expireDateFocusNode = FocusNode();
  final cvcFocusNode = FocusNode();

  final BuildContext context;
  final Validator _validator;
  final CreditCard data;

  PaymentFormController({@required context, CreditCard data})
      : context = context,
        data = data ?? CreditCard(),
        _validator = Validator.of(context);

  String userCardNameValidator(String value) {
    return _validator.validatePresence(value);
  }

  void userCardNameSubmitted(String value) {
    _changeFocus(cardNumberFocusNode);
  }

  String cardNumberValidator(String value) {
    return _validator.validatePresence(value);
  }

  void cardNumberSubmitted(String value) {
    _changeFocus(expireDateFocusNode);
  }

  String expireDateValidator(String value) {
    return _validator.validatePresence(value);
  }

  void expireDateSubmitted(String value) {
    _changeFocus(cvcFocusNode);
  }

  String cvcValidator(String value) {
    return _validator.validatePresence(value);
  }

  void _changeFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }
}
