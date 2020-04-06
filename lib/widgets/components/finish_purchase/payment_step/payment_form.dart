import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/payment_form_controller.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/widgets/components/outline_form_text_field.dart';

class PaymentForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  PaymentForm({
    Key key,
    this.formKey,
  }) : super(key: key);

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    final controller = PaymentFormController.of(context);
    final theme = Theme.of(context);

    return Container(
      child: Form(
        key: widget.formKey,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  translator.translate('payment_title_text'),
                  style: theme.primaryTextTheme.title,
                ),
              ),
              OutlineFormTextField(
                labelText: translator.translate("user_card_name_label_text"),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                focusNode: controller.userCardNameFocusNode,
                validator: controller.userCardNameValidator,
                onFieldSubmitted: controller.userCardNameSubmitted,
                onFieldSaved: _userCardNameSaved,
              ),
              OutlineFormTextField(
                labelText: translator.translate("card_number_label_text"),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: controller.cardNumberFocusNode,
                validator: controller.cardNumberValidator,
                onFieldSubmitted: controller.cardNumberSubmitted,
                onFieldSaved: _cardNumberSaved,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: OutlineFormTextField(
                      labelText:
                          translator.translate("card_expire_date_label_text"),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: controller.expireDateFocusNode,
                      validator: controller.expireDateValidator,
                      onFieldSubmitted: controller.expireDateSubmitted,
                      onFieldSaved: _expireDateSaved,
                    ),
                  ),
                  Expanded(
                    child: OutlineFormTextField(
                      labelText: translator.translate("card_cvc_label_text"),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      focusNode: controller.cvcFocusNode,
                      validator: controller.cvcValidator,
                      onFieldSaved: _cvcSaved,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _userCardNameSaved(String value) {}
  void _cardNumberSaved(String value) {}
  void _expireDateSaved(String value) {}
  void _cvcSaved(String value) {}
}
