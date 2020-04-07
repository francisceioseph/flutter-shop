import 'package:flutter/material.dart';

class ProfilePageHeader extends StatelessWidget {
  const ProfilePageHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).primaryTextTheme;

    return Container(
      margin: EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.asset(
                'assets/images/placeholder.jpg',
                width: 100,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Text('The User Name', style: textTheme.title),
            ),
          ),
        ],
      ),
    );
  }
}
