import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/shipping_form_controller.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';
import 'package:flutter_shop/models/shipping.dart';
import 'package:flutter_shop/models/state/shipping_state.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/shipping_step/shipping_form/address_line_1.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/shipping_step/shipping_form/address_line_2.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/shipping_step/shipping_form/address_line_3.dart';
import 'package:flutter_shop/widgets/components/simple_outline_button.dart';
import 'package:provider/provider.dart';

class ShippingTabForm extends StatefulWidget {
  ShippingTabForm({Key key}) : super(key: key);

  @override
  _ShippingTabFormState createState() => _ShippingTabFormState();
}

class _ShippingTabFormState extends State<ShippingTabForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ShippingFormController controller;

  @override
  void initState() {
    super.initState();

    ProviderHelper.shippingState(context).loadShippingData();
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);

    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
          left: 8,
          right: 8,
          bottom: 16,
        ),
        child: Consumer<ShippingState>(
          builder: (BuildContext context, ShippingState state, _) {
            return StreamBuilder(
              stream: state.shipping,
              builder: (
                BuildContext context,
                AsyncSnapshot<Shipping> snapshot,
              ) {
                if (snapshot.hasData) {
                  controller = ShippingFormController(
                    context: context,
                    data: snapshot.data,
                  );

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        AddressLine1(
                          controller: controller,
                          onAddressSaved: _addressSaved,
                        ),
                        AddressLine2(
                          controller: controller,
                          onCountrySaved: _countrySaved,
                          onStateSaved: _stateSaved,
                        ),
                        AddressLine3(
                          controller: controller,
                          onCitySaved: _citySaved,
                          onZipSaved: _zipSaved,
                        ),
                        SimpleOutlineButton(
                          margin: EdgeInsets.only(
                            left: 8,
                            right: 8,
                          ),
                          child: Text(
                            translator.translate('save'),
                            style: Theme.of(context).primaryTextTheme.button,
                          ),
                          onPressed: _submit,
                        )
                      ],
                    ),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _addressSaved(String value) {
    setState(() {
      controller.data.address = value;
    });
  }

  void _countrySaved(String value) {
    setState(() {
      controller.data.country = value;
    });
  }

  void _stateSaved(String value) {
    setState(() {
      controller.data.state = value;
    });
  }

  void _citySaved(String value) {
    setState(() {
      controller.data.city = value;
    });
  }

  void _zipSaved(String value) {
    setState(() {
      controller.data.zip = value;
    });
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      ProviderHelper.shippingState(context).saveShipping(controller.data);
    }
  }
}
