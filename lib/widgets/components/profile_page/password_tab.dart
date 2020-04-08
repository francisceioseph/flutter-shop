import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/profile_page/password_tab_form.dart';

class PasswordTab extends StatelessWidget {
  const PasswordTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PasswordTabForm(),
    );
  }
}
