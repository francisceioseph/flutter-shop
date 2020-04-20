import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/credit_card_state.dart';
import 'package:flutter_shop/models/state/personal_info_state.dart';
import 'package:flutter_shop/models/state/products_state.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:flutter_shop/models/state/categories_state.dart';
import 'package:provider/provider.dart';

class ProviderHelper {
  static ProductsState productsState(BuildContext context) {
    return Provider.of<ProductsState>(context, listen: false);
  }

  static CartState cartState(BuildContext context) {
    return Provider.of<CartState>(context, listen: false);
  }

  static CategoriesState categoriesState(BuildContext context) {
    return Provider.of<CategoriesState>(context, listen: false);
  }

  static CreditCardState creditCardState(BuildContext context) {
    return Provider.of<CreditCardState>(context, listen: false);
  }

  static PersonalInfoState personalInfoState(BuildContext context) {
    return Provider.of<PersonalInfoState>(context, listen: false);
  }
}
