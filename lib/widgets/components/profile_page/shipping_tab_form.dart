import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/shipping_form_controller.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/outline_form_text_field.dart';
import 'package:flutter_shop/widgets/components/simple_outline_button.dart';

class ShippingTabForm extends StatefulWidget {
  ShippingTabForm({Key key}) : super(key: key);

  @override
  _ShippingTabFormState createState() => _ShippingTabFormState();
}

class _ShippingTabFormState extends State<ShippingTabForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    final controller = ShippingFormController.of(context);

    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
          left: 8,
          right: 8,
          bottom: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
              SimpleOutlineButton(
                margin: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Text(translator.translate('save')),
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addressSaved(String value) {}
  void _countrySaved(String value) {}
  void _stateSaved(String value) {}
  void _citySaved(String value) {}
  void _zipSaved(String value) {}
  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }
}
