import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/shipping_form_controller.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/outline_form_text_field.dart';

class NameLine extends StatelessWidget {
  final ShippingFormController controller;
  final void Function(String) onFullNameSaved;

  const NameLine({
    Key key,
    @required this.controller,
    this.onFullNameSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);

    return OutlineFormTextField(
      labelText: translator.translate("full_name_label_text"),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      initialValue: controller.data.fullName,
      focusNode: controller.fullNameFocusNode,
      validator: controller.fullNameValidator,
      onFieldSubmitted: controller.fullNameSubmitted,
      onFieldSaved: onFullNameSaved,
    );
  }
}
