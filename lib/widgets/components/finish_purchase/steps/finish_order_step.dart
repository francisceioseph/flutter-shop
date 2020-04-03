import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/simple_outline_button.dart';

class FinishOrderStep extends StatelessWidget {
  final void Function() onNextTap;
  final void Function() onBackTap;

  const FinishOrderStep({
    Key key,
    this.onNextTap,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container()),
          SimpleOutlineButton(
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 8,
            ),
            child: Text('back'),
            onPressed: onBackTap,
          ),
          SimpleOutlineButton(
            margin: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Text('finish purchase'),
            onPressed: onNextTap,
          )
        ],
      ),
    );
  }
}
