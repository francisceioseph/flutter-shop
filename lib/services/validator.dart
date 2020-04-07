import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/config/constants.dart';
import 'package:flutter_shop/services/app_localizations.dart';

class Validator {
  final BuildContext context;
  final AppLocalizations _translator;

  Validator.of(BuildContext context)
      : context = context,
        _translator = AppLocalizations.of(context);

  String validateEmail(String value) {
    final regex = RegExp(kEmailRegex);
    final hasMatch = regex.hasMatch(value);

    if (hasMatch) {
      return null;
    }

    return _translator.translate('email_error_text');
  }

  String validatePresence(String value) {
    if (value.isEmpty) {
      return _translator.translate('empty_field_error_message');
    }

    return null;
  }
}
