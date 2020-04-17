import 'package:flutter/material.dart';
import 'package:flutter_shop/models/credit_card.dart';
import 'package:flutter_shop/models/state/credit_card_state.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/payment_step/payment_form.dart';
import 'package:provider/provider.dart';

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
    return Consumer<CreditCardState>(
      builder: (BuildContext context, CreditCardState state, _) {
        return StreamBuilder(
          stream: state.creditCard,
          builder: (BuildContext context, AsyncSnapshot<CreditCard> snapshot) {
            if (snapshot.hasData) {
              return PaymentForm(
                initialData: snapshot.data,
                onBackTap: onBackTap,
                onNextTap: onNextTap,
              );
            }

            state.loadCreditCardData();

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
