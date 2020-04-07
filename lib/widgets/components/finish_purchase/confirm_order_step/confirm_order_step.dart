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
              'confirm your order',
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
                  'Amount to pay for this order',
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
                    return Text(
                      "R\$ ${cart.totalCartValue}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).primaryTextTheme.title.copyWith(
                            color: Theme.of(context).accentColor,
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                          ),
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
            nextButtonText: 'process payment',
            onNextTap: onNextTap,
            onBackTap: onBackTap,
          ),
        )
      ],
    );
  }
}
