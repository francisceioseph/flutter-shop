import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/shipping_form_controller.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/outline_form_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddressLine3 extends StatelessWidget {
  final ShippingFormController controller;
  final void Function(String) onCitySaved;
  final void Function(String) onZipSaved;

  const AddressLine3({
    Key key,
    @required this.controller,
    this.onCitySaved,
    this.onZipSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    final zipMask = MaskTextInputFormatter(
      mask: "#####-###",
      filter: {"#": RegExp(r'[0-9]')},
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: OutlineFormTextField(
            labelText: translator.translate("city_label_text"),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            initialValue: controller.data.city,
            focusNode: controller.cityFocusNode,
            validator: controller.cityValidator,
            onFieldSubmitted: controller.citySubmitted,
            onFieldSaved: onCitySaved,
          ),
        ),
        Expanded(
          child: OutlineFormTextField(
            labelText: translator.translate("zip_label_text"),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            initialValue: controller.data.zip,
            focusNode: controller.zipFocusNode,
            validator: controller.zipValidator,
            onFieldSubmitted: controller.zipSubmitted,
            onFieldSaved: onZipSaved,
            inputFormatters: [zipMask],
          ),
        ),
      ],
    );
  }
}
