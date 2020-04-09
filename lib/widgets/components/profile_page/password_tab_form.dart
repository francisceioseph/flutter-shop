import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/password_tab_form_controller.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/outline_form_text_field.dart';
import 'package:flutter_shop/widgets/components/simple_outline_button.dart';

class PasswordTabForm extends StatefulWidget {
  const PasswordTabForm({Key key}) : super(key: key);

  @override
  _PasswordTabFormState createState() => _PasswordTabFormState();
}

class _PasswordTabFormState extends State<PasswordTabForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    final controller = PasswordTabFormController.of(context);

    return Container(
      margin: EdgeInsets.only(
        top: 16,
        left: 8,
        right: 8,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              OutlineFormTextField(
                labelText: translator.translate("full_name_label_text"),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.oldPasswordFocusNode,
                validator: controller.oldPasswordValidator,
                onFieldSubmitted: controller.oldPasswordSubmitted,
                onFieldSaved: _oldPasswordSaved,
              ),
              OutlineFormTextField(
                labelText: translator.translate("birth_date_label_text"),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.newPasswordFocusNode,
                validator: controller.newPasswordValidator,
                onFieldSubmitted: controller.newPasswordSubmitted,
                onFieldSaved: _newPasswordSaved,
              ),
              OutlineFormTextField(
                labelText: translator.translate("email_label_text"),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                focusNode: controller.newPasswordConfirmationFocusNode,
                validator: controller.newPasswordConfirmationValidator,
                onFieldSaved: _newPasswordConfirmationSaved,
              ),
              SimpleOutlineButton(
                margin: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Text(
                  translator.translate('save'),
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _oldPasswordSaved(String value) {}
  void _newPasswordSaved(String value) {}
  void _newPasswordConfirmationSaved(String value) {}
  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }
}
