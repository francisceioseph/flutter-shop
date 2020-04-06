import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/shipping_step/shipping_form.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/step_buttons.dart';

class ShippingStep extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final void Function() onNextTap;
  final void Function() onBackTap;

  ShippingStep({
    Key key,
    this.onNextTap,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: ShippingForm(
            formKey: _formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: StepButtons(
            onNextTap: _onNextTap,
            onBackTap: onBackTap,
          ),
        )
      ],
    );
  }

  void _onNextTap() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      this.onNextTap();
    }
  }
}
