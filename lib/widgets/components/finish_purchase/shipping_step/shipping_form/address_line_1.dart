import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/shipping_form_controller.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/outline_form_text_field.dart';

class AddressLine1 extends StatelessWidget {
  final ShippingFormController controller;
  final void Function(String) onAddressSaved;

  const AddressLine1({
    Key key,
    @required this.controller,
    this.onAddressSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);

    return OutlineFormTextField(
      labelText: translator.translate("address_label_text"),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      initialValue: controller.data.address,
      focusNode: controller.addressFocusNode,
      validator: controller.addressValidator,
      onFieldSubmitted: controller.addressSubmitted,
      onFieldSaved: onAddressSaved,
    );
  }
}
