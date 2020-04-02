import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/app_state.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:provider/provider.dart';

class ProviderHelper {
  static AppState appState(BuildContext context) {
    return Provider.of<AppState>(context, listen: false);
  }

  static CartState cartState(BuildContext context) {
    return Provider.of<CartState>(context, listen: false);
  }
}
