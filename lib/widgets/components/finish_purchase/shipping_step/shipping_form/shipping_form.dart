import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/shipping_form_controller.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/shipping_step/shipping_form/address_line_1.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/shipping_step/shipping_form/address_line_2.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/shipping_step/shipping_form/address_line_3.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/shipping_step/shipping_form/name_line.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/step_buttons.dart';

class ShippingForm extends StatefulWidget {
  final void Function() onNextTap;
  final void Function() onBackTap;

  ShippingForm({
    Key key,
    @required this.onNextTap,
    @required this.onBackTap,
  }) : super(key: key);

  @override
  _ShippingFormState createState() => _ShippingFormState();
}

class _ShippingFormState extends State<ShippingForm> {
  GlobalKey<FormState> _formKey;
  AppLocalizations _translator;
  ShippingFormController _controller;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _translator = AppLocalizations.of(context);
    _controller = ShippingFormController.of(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Form(
            key: _formKey,
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
                      _translator.translate('shipping_title_text'),
                      style: theme.primaryTextTheme.title,
                    ),
                  ),
                  NameLine(
                    controller: _controller,
                    onFullNameSaved: _fullNameSaved,
                  ),
                  AddressLine1(
                    controller: _controller,
                    onAddressSaved: _addressSaved,
                  ),
                  AddressLine2(
                    controller: _controller,
                    onCountrySaved: _countrySaved,
                    onStateSaved: _stateSaved,
                  ),
                  AddressLine3(
                    controller: _controller,
                    onCitySaved: _citySaved,
                    onZipSaved: _zipSaved,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: StepButtons(
            onNextTap: _onNextTap,
            onBackTap: widget.onBackTap,
          ),
        )
      ],
    );
  }

  void _fullNameSaved(String value) {
    setState(() {
      _controller.data.fullName = value;
    });
  }

  void _addressSaved(String value) {
    setState(() {
      _controller.data.address = value;
    });
  }

  void _countrySaved(String value) {
    setState(() {
      _controller.data.country = value;
    });
  }

  void _stateSaved(String value) {
    setState(() {
      _controller.data.state = value;
    });
  }

  void _citySaved(String value) {
    setState(() {
      _controller.data.city = value;
    });
  }

  void _zipSaved(String value) {
    setState(() {
      _controller.data.zip = value;
    });
  }

  void _onNextTap() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.onNextTap();
    }
  }
}
