import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/components/profile_page/personal_tab_form.dart';

class PersonalTab extends StatelessWidget {
  const PersonalTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PersonalTabForm(),
    );
  }
}
