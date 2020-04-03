import 'package:flutter/material.dart';

class PaymentStep extends StatelessWidget {
  final void Function() onSubmit;

  const PaymentStep({Key key, this.onSubmit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          child: Text('step'),
          onPressed: onSubmit,
        ),
      ),
    );
  }
}
