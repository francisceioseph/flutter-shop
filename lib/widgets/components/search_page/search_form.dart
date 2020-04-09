import 'package:flutter/material.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:line_icons/line_icons.dart';

class SearchForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final void Function(String) onValueChange;
  final void Function() onSubmitForm;

  const SearchForm({
    Key key,
    @required this.formKey,
    @required this.controller,
    this.onValueChange,
    this.onSubmitForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    final textStyle = Theme.of(context).primaryTextTheme.body1.copyWith(
          fontFamily: 'BellotaText',
        );
    return Container(
      child: Form(
        key: formKey,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextFormField(
                controller: controller,
                maxLength: null,
                minLines: 1,
                maxLines: 2,
                onChanged: onValueChange,
                decoration: InputDecoration(
                  hintText: translator.translate('search_label_text'),
                  errorStyle: textStyle.copyWith(
                    color: Colors.red,
                  ),
                ),
                style: textStyle,
              ),
            ),
            IconButton(
              icon: Icon(LineIcons.search),
              onPressed: onSubmitForm,
            ),
          ],
        ),
      ),
    );
  }
}
