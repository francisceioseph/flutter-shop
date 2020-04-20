import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/shipping_step/shipping_form/shipping_form.dart';

class ShippingStep extends StatelessWidget {
  final void Function() onNextTap;
  final void Function() onBackTap;

  ShippingStep({
    Key key,
    this.onNextTap,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShippingForm(
      onNextTap: onNextTap,
      onBackTap: onBackTap,
    );
  }
}
