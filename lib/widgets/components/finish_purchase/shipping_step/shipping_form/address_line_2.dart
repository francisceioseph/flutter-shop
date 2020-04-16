import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/shipping_form_controller.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/outline_form_text_field.dart';

class AddressLine2 extends StatelessWidget {
  final ShippingFormController controller;
  final void Function(String) onCountrySaved;
  final void Function(String) onStateSaved;

  const AddressLine2({
    Key key,
    @required this.controller,
    this.onCountrySaved,
    this.onStateSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: OutlineFormTextField(
            labelText: translator.translate("country_label_text"),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            initialValue: controller.data.country,
            focusNode: controller.countryFocusNode,
            validator: controller.countryValidator,
            onFieldSubmitted: controller.countrySubmitted,
            onFieldSaved: onCountrySaved,
          ),
        ),
        Expanded(
          child: OutlineFormTextField(
            labelText: translator.translate("state_label_text"),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            initialValue: controller.data.state,
            focusNode: controller.stateFocusNode,
            validator: controller.stateValidator,
            onFieldSubmitted: controller.stateSubmitted,
            onFieldSaved: onStateSaved,
          ),
        ),
      ],
    );
  }
}
