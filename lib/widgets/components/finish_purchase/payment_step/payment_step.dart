import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/payment_step/payment_form.dart';

class PaymentStep extends StatelessWidget {
  final void Function() onNextTap;
  final void Function() onBackTap;

  PaymentStep({
    Key key,
    this.onNextTap,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PaymentForm(
      onBackTap: onBackTap,
      onNextTap: onNextTap,
    );
  }
}
