import 'package:flutter/material.dart';
import 'package:flutter_shop/controllers/payment_form_controller.dart';
import 'package:flutter_shop/helpers/provider_helper.dart';
import 'package:flutter_shop/models/credit_card.dart';
import 'package:flutter_shop/services/app_localizations.dart';
import 'package:flutter_shop/services/singleton.dart';
import 'package:flutter_shop/widgets/components/finish_purchase/step_buttons.dart';
import 'package:flutter_shop/widgets/components/outline_form_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PaymentForm extends StatefulWidget {
  final CreditCard initialData;
  final void Function() onNextTap;
  final void Function() onBackTap;

  PaymentForm({
    Key key,
    @required this.onNextTap,
    @required this.onBackTap,
    this.initialData,
  }) : super(key: key);

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  GlobalKey<FormState> formKey;
  AppLocalizations translator;
  PaymentFormController controller;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();

    ProviderHelper.creditCardState(context).loadCreditCardData();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    translator = AppLocalizations.of(context);
    controller = PaymentFormController(
      context: context,
      data: widget.initialData,
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final creditCardNumberMask = MaskTextInputFormatter(
      mask: "#### #### #### ####",
      filter: {"#": RegExp(r'[0-9]')},
    );

    final expireDateMask = MaskTextInputFormatter(
      mask: "####/##",
      filter: {"#": RegExp(r'[0-9]')},
    );

    final cvcMask = MaskTextInputFormatter(
      mask: "###",
      filter: {"#": RegExp(r'[0-9]')},
    );

    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Form(
          key: formKey,
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
                  initialValue: controller.data.ownerName,
                  focusNode: controller.userCardNameFocusNode,
                  validator: controller.userCardNameValidator,
                  onFieldSubmitted: controller.userCardNameSubmitted,
                  onFieldSaved: _userCardNameSaved,
                ),
                OutlineFormTextField(
                  labelText: translator.translate("card_number_label_text"),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  initialValue: controller.data.number,
                  focusNode: controller.cardNumberFocusNode,
                  validator: controller.cardNumberValidator,
                  onFieldSubmitted: controller.cardNumberSubmitted,
                  onFieldSaved: _cardNumberSaved,
                  inputFormatters: [creditCardNumberMask],
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
                        initialValue: controller.data.expiresAt,
                        focusNode: controller.expireDateFocusNode,
                        validator: controller.expireDateValidator,
                        onFieldSubmitted: controller.expireDateSubmitted,
                        onFieldSaved: _expireDateSaved,
                        inputFormatters: [expireDateMask],
                      ),
                    ),
                    Expanded(
                      child: OutlineFormTextField(
                        labelText: translator.translate("card_cvc_label_text"),
                        obscureText: true,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        initialValue: controller.data.cvc,
                        focusNode: controller.cvcFocusNode,
                        validator: controller.cvcValidator,
                        onFieldSaved: _cvcSaved,
                        inputFormatters: [cvcMask],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      SliverFillRemaining(
        hasScrollBody: false,
        child: StepButtons(
          onNextTap: _onNextTap,
          onBackTap: widget.onBackTap,
        ),
      ),
    ]);
  }

  void _userCardNameSaved(String value) {
    setState(() {
      controller.data.ownerName = value;
    });
  }

  void _cardNumberSaved(String value) {
    setState(() {
      controller.data.number = value;
    });
  }

  void _expireDateSaved(String value) {
    setState(() {
      controller.data.expiresAt = value;
    });
  }

  void _cvcSaved(String value) {
    setState(() {
      controller.data.cvc = value;
    });
  }

  void _onNextTap() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Singleton.creditCardRepository.saveCreditCard(controller.data);
      widget.onNextTap();
    }
  }
}
