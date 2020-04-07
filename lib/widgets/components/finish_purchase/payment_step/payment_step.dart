import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/payment_step/payment_form.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/step_buttons.dart';

class PaymentStep extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final void Function() onNextTap;
  final void Function() onBackTap;

  PaymentStep({
    Key key,
    this.onNextTap,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: PaymentForm(
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
    // if (_formKey.currentState.validate()) {
    // _formKey.currentState.save();
    this.onNextTap();
    // }
  }
}
