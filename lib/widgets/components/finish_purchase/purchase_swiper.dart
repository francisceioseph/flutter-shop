import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/page_slider_controller.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/finish_purchase_dialog.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/shipping_step/shipping_step.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/steps/cart_review_step.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/steps/confirm_order_step.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/steps/finish_order_step.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/steps/payment_step.dart';
import 'package:flutter_shop/widgets/components/page_slider.dart';

class PurchaseSwiper extends StatefulWidget {
  final int initialIndex;

  PurchaseSwiper({
    Key key,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  _PurchaseSwiperState createState() => _PurchaseSwiperState();
}

class _PurchaseSwiperState extends State<PurchaseSwiper> {
  PageSliderController _controller = PageSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: PageSlider(
        controller: _controller,
        children: <Widget>[
          CartReviewStep(
            onNextTap: _onNextTap,
          ),
          ShippingStep(
            onNextTap: _onNextTap,
            onBackTap: _onBackTap,
          ),
          PaymentStep(
            onNextTap: _onNextTap,
            onBackTap: _onBackTap,
          ),
          ConfirmOrderStep(
            onNextTap: _onNextTap,
            onBackTap: _onBackTap,
          ),
          FinishOrderStep(
            onNextTap: _onFinishPurchase,
            onBackTap: _onBackTap,
          ),
        ],
      ),
    );
  }

  void _onNextTap() {
    _controller.next();
  }

  void _onFinishPurchase() {
    showDialog(
      context: context,
      child: FinishPurchaseDialog(),
    );
  }

  void _onBackTap() {
    _controller.back();
  }
}
