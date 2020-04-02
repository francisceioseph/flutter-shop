import 'package:flutter/material.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';
import 'package:flutter_shop/widgets/components/search_page/search_form.dart';
import 'package:flutter_shop/widgets/components/search_page/search_result_grid.dart';
import 'package:rxdart/rxdart.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String content = '';
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _changeTextSubject = PublishSubject<String>();

  @override
  void initState() {
    _changeTextSubject
        .debounceTime(Duration(milliseconds: 500))
        .listen(_onValueChanged);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: SearchForm(
                formKey: _formKey,
                controller: _controller,
                onValueChange: (String value) => _changeTextSubject.add(value),
                onSubmitForm: _onSubmitForm,
              ),
            ),
            SearchResultGrid(),
          ],
        ),
      ),
    );
  }

  void _onValueChanged(String value) {
    setState(() {
      content = value;
    });

    if (value.length > 3) {
      _onSubmitForm();
    }
  }

  void _onSubmitForm() {
    ProviderHelper.appState(context).filterProducts(content);
  }

  @override
  void dispose() {
    _changeTextSubject.close();
    super.dispose();
  }
}
