import 'package:flutter/material.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/purchase_swiper.dart';

class PlaceOrderPage extends StatelessWidget {
  static const routeName = '/finish-purchase';

  const PlaceOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context).translate("finish_purchase_text"),
            ),
          ),
          body: Container(
            child: PurchaseSwiper(),
          ),
        ),
      ),
    );
  }
}
