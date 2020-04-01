import 'package:flutter/material.dart';
import 'package:flutter_shop/models/state/app_state_model.dart';
import 'package:flutter_shop/widgets/components/search_page/search_form.dart';
import 'package:flutter_shop/widgets/components/search_page/search_result_grid.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String content = '';
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: SearchForm(
                formKey: _formKey,
                controller: _controller,
                onValueChange: _onValueChange,
                onSubmitForm: _onSubmitForm,
              ),
            ),
            SearchResultGrid(),
          ],
        ),
      ),
    );
  }

  void _onValueChange(String value) {
    setState(() {
      content = value;
      Provider.of<AppStateModel>(context, listen: false)
          .filterProducts(content);
    });
  }

  void _onSubmitForm() {
    Provider.of<AppStateModel>(context, listen: false).filterProducts(content);
  }
}
