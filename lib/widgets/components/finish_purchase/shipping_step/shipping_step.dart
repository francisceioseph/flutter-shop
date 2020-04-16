import 'package:flutter/material.dart';
import 'package:flutter_shop/models/shipping.dart';
import 'package:flutter_shop/models/state/shipping_state.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/shipping_step/shipping_form/shipping_form.dart';
import 'package:provider/provider.dart';

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
    return Consumer<ShippingState>(
      builder: (BuildContext context, ShippingState state, _) {
        return StreamBuilder(
          stream: state.shipping,
          builder: (BuildContext context, AsyncSnapshot<Shipping> snapshot) {
            if (snapshot.hasData) {
              return ShippingForm(
                initialData: snapshot.data,
                onNextTap: onNextTap,
                onBackTap: onBackTap,
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
