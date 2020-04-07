import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/personal_tab_form_controller.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/outline_form_text_field.dart';
import 'package:flutter_shop/widgets/components/simple_outline_button.dart';

class PersonalTabForm extends StatefulWidget {
  PersonalTabForm({Key key}) : super(key: key);

  @override
  _PersonalTabFormState createState() => _PersonalTabFormState();
}

class _PersonalTabFormState extends State<PersonalTabForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = PersonalTabFormController.of(context);
    final translator = AppLocalizations.of(context);

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
                focusNode: controller.nameFocusNode,
                validator: controller.nameValidator,
                onFieldSubmitted: controller.nameSubmitted,
                onFieldSaved: _nameSaved,
              ),
              OutlineFormTextField(
                labelText: translator.translate("birth_date_label_text"),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: controller.birthDateFocusNode,
                validator: controller.birthDateValidator,
                onFieldSubmitted: controller.birthDateSubmitted,
                onFieldSaved: _birthDateSaved,
              ),
              OutlineFormTextField(
                labelText: translator.translate("email_label_text"),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.emailFocusNode,
                validator: controller.emailValidator,
                onFieldSubmitted: controller.emailSubmitted,
                onFieldSaved: _emailSaved,
              ),
              OutlineFormTextField(
                labelText: translator.translate("phone_label_text"),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.phoneFocusNode,
                validator: controller.phoneValidator,
                onFieldSaved: _phoneSaved,
              ),
              SimpleOutlineButton(
                margin: EdgeInsets.only(
                  left: 8,
                  right: 8,
                ),
                child: Text('save'),
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _nameSaved(String value) {}
  void _birthDateSaved(String value) {}
  void _emailSaved(String value) {}
  void _phoneSaved(String value) {}

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }
}
