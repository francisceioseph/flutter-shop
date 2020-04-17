import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/cart_state.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/step_buttons.dart';
import 'package:provider/provider.dart';

class ConfirmOrderStep extends StatelessWidget {
  final void Function() onNextTap;
  final void Function() onBackTap;

  const ConfirmOrderStep({
    Key key,
    this.onNextTap,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
              bottom: 24,
            ),
            child: Text(
              translator.translate('confirm_step_title'),
              style: Theme.of(context).primaryTextTheme.title,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                ),
                child: Text(
                  translator.translate('amount_to_pay_title'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).primaryTextTheme.title.copyWith(
                        color: Colors.grey[350],
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                  right: 16,
                  left: 16,
                ),
                child: Consumer<CartState>(
                  builder: (context, cart, _) {
                    return StreamBuilder(
                      stream: cart.totalCartValue,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<double> snapshot,
                      ) {
                        if (snapshot.hasData) {
                          return Text(
                            "R\$ ${snapshot.data}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .primaryTextTheme
                                .title
                                .copyWith(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                ),
                          );
                        }

                        return Container();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: StepButtons(
            nextButtonText: translator.translate('process_payment_button_text'),
            onNextTap: onNextTap,
            onBackTap: onBackTap,
          ),
        )
      ],
    );
  }
}
