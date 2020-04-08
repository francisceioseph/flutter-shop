import 'package:flutter/material.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/profile_page/personal_tab.dart';
import 'package:flutter_shop/widgets/components/profile_page/profile_page_header.dart';
import 'package:flutter_shop/widgets/components/profile_page/shipping_tab.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';

  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    // final textTheme = Theme.of(context).primaryTextTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            translator.translate('profile_app_bar_text'),
          ),
        ),
        body: Column(
          children: <Widget>[
            ProfilePageHeader(),
            Container(
              child: TabBar(
                controller: controller,
                tabs: [
                  Tab(text: translator.translate('personal')),
                  Tab(text: translator.translate('shipping')),
                  Tab(text: translator.translate('password')),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: <Widget>[
                  PersonalTab(),
                  ShippingTab(),
                  ProfilePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
