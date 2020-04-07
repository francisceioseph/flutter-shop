import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/profile_page/shipping_tab_form.dart';

class ShippingTab extends StatelessWidget {
  const ShippingTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ShippingTabForm(),
    );
  }
}
