import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/shipping_form_controller.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/outline_form_text_field.dart';

class ShippingForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  ShippingForm({Key key, this.formKey}) : super(key: key);

  @override
  _ShippingFormState createState() => _ShippingFormState();
}

class _ShippingFormState extends State<ShippingForm> {
  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    final controller = ShippingFormController.of(context);
    final theme = Theme.of(context);

    return Form(
      key: widget.formKey,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              child: Text(
                translator.translate('shipping_title_text'),
                style: theme.primaryTextTheme.title,
              ),
            ),
            OutlineFormTextField(
              labelText: translator.translate("full_name_label_text"),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              focusNode: controller.fullNameFocusNode,
              validator: controller.fullNameValidator,
              onFieldSubmitted: controller.fullNameSubmitted,
              onFieldSaved: _fullNameSaved,
            ),
            OutlineFormTextField(
              labelText: translator.translate("address_label_text"),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              focusNode: controller.addressFocusNode,
              validator: controller.addressValidator,
              onFieldSubmitted: controller.addressSubmitted,
              onFieldSaved: _addressSaved,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: OutlineFormTextField(
                    labelText: translator.translate("country_label_text"),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: controller.countryFocusNode,
                    validator: controller.countryValidator,
                    onFieldSubmitted: controller.countrySubmitted,
                    onFieldSaved: _countrySaved,
                  ),
                ),
                Expanded(
                  child: OutlineFormTextField(
                    labelText: translator.translate("state_label_text"),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: controller.stateFocusNode,
                    validator: controller.stateValidator,
                    onFieldSubmitted: controller.stateSubmitted,
                    onFieldSaved: _stateSaved,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: OutlineFormTextField(
                    labelText: translator.translate("city_label_text"),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: controller.cityFocusNode,
                    validator: controller.cityValidator,
                    onFieldSubmitted: controller.citySubmitted,
                    onFieldSaved: _citySaved,
                  ),
                ),
                Expanded(
                  child: OutlineFormTextField(
                    labelText: translator.translate("zip_label_text"),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: controller.zipFocusNode,
                    validator: controller.zipValidator,
                    onFieldSubmitted: controller.zipSubmitted,
                    onFieldSaved: _zipSaved,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _fullNameSaved(String value) {}
  void _addressSaved(String value) {}
  void _countrySaved(String value) {}
  void _stateSaved(String value) {}
  void _citySaved(String value) {}
  void _zipSaved(String value) {}
}
