import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/app_state_model.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:provider/provider.dart';

class ProviderHelper {
  static AppStateModel appState(BuildContext context) {
    return Provider.of<AppStateModel>(context, listen: false);
  }

  static CartState cartState(BuildContext context) {
    return Provider.of<CartState>(context, listen: false);
  }
}
