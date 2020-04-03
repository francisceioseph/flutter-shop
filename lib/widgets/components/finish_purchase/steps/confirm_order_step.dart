import 'package:flutter/material.dart';

class ConfirmOrderStep extends StatelessWidget {
  final void Function() onSubmit;

  const ConfirmOrderStep({
    Key key,
    this.onSubmit,
  }) : super(key: key);

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
