import 'package:flutter_shop/config/constants.dart';

class ValidatorHelper {
  static bool validateEmail(String value) {
    final regex = RegExp(kEmailRegex);
    return regex.hasMatch(value);
  }
}
