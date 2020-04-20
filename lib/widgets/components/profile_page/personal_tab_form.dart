import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/personal_tab_form_controller.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';
import 'package:flutter_shop/models/personal_information.dart';
import 'package:flutter_shop/models/state/personal_info_state.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/outline_form_text_field.dart';
import 'package:flutter_shop/widgets/components/simple_outline_button.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PersonalTabForm extends StatefulWidget {
  PersonalTabForm({Key key}) : super(key: key);

  @override
  _PersonalTabFormState createState() => _PersonalTabFormState();
}

class _PersonalTabFormState extends State<PersonalTabForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  PersonalTabFormController controller;

  @override
  void initState() {
    super.initState();

    ProviderHelper.personalInfoState(context).loadPersonalInfo();
  }

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);

    final birthDateMask = MaskTextInputFormatter(
      mask: translator.translate('birth_date_mask'),
      filter: {"#": RegExp(r'[0-9]')},
    );

    final telephoneMask = MaskTextInputFormatter(
      mask: translator.translate('phone_mask'),
      filter: {"#": RegExp(r'[0-9]')},
    );

    return Container(
      margin: EdgeInsets.only(
        top: 16,
        left: 8,
        right: 8,
      ),
      child: Form(
        key: _formKey,
        child: Consumer<PersonalInfoState>(
          builder: (
            BuildContext context,
            PersonalInfoState state,
            _,
          ) {
            return StreamBuilder(
              stream: state.personalInfo,
              builder: (
                BuildContext context,
                AsyncSnapshot<PersonalInformation> snapshot,
              ) {
                if (snapshot.hasData) {
                  final personalInfo = snapshot.data;

                  controller = PersonalTabFormController(
                    context: context,
                    personalInformation: personalInfo,
                  );

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        OutlineFormTextField(
                          labelText:
                              translator.translate("full_name_label_text"),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          focusNode: controller.nameFocusNode,
                          validator: controller.nameValidator,
                          onFieldSubmitted: controller.nameSubmitted,
                          onFieldSaved: _nameSaved,
                          initialValue: controller.personalInformation.fullName,
                        ),
                        OutlineFormTextField(
                          labelText:
                              translator.translate("birth_date_label_text"),
                          keyboardType: TextInputType.datetime,
                          textInputAction: TextInputAction.next,
                          focusNode: controller.birthDateFocusNode,
                          validator: controller.birthDateValidator,
                          onFieldSubmitted: controller.birthDateSubmitted,
                          onFieldSaved: _birthDateSaved,
                          initialValue:
                              controller.personalInformation.birthDate,
                          inputFormatters: [birthDateMask],
                        ),
                        OutlineFormTextField(
                          labelText: translator.translate("email_label_text"),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          focusNode: controller.emailFocusNode,
                          validator: controller.emailValidator,
                          onFieldSubmitted: controller.emailSubmitted,
                          onFieldSaved: _emailSaved,
                          initialValue: controller.personalInformation.email,
                        ),
                        OutlineFormTextField(
                          labelText: translator.translate("phone_label_text"),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          focusNode: controller.phoneFocusNode,
                          validator: controller.phoneValidator,
                          onFieldSaved: _phoneSaved,
                          initialValue: controller.personalInformation.phone,
                          inputFormatters: [telephoneMask],
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
                        ),
                      ],
                    ),
                  );
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _nameSaved(String value) {
    controller.personalInformation.fullName = value;
  }

  void _birthDateSaved(String value) {
    controller.personalInformation.birthDate = value;
  }

  void _emailSaved(String value) {
    controller.personalInformation.email = value;
  }

  void _phoneSaved(String value) {
    controller.personalInformation.phone = value;
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      ProviderHelper.personalInfoState(context)
          .setPersonalInfo(controller.personalInformation);
    }
  }
}
