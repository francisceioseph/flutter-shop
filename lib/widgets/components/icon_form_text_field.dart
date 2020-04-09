import 'package:flutter/material.dart';

class IconFormTextField extends StatelessWidget {
  final FocusNode focusNode;

  final String hintText;
  final String labelText;
  final String Function(String) validator;
  final void Function(String) onFieldSubmitted;
  final void Function(String) onFieldSaved;
  final void Function(String) onChanged;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final int maxLines;
  final IconData leadingIcon;

  IconFormTextField({
    Key key,
    this.hintText,
    this.labelText,
    this.validator,
    this.focusNode,
    this.obscureText = false,
    this.onFieldSubmitted,
    this.onFieldSaved,
    this.onChanged,
    this.leadingIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).primaryTextTheme.body1.copyWith(
          fontFamily: 'BellotaText',
        );
    return Container(
      child: ListTile(
        leading: this.leadingIcon != null ? Icon(this.leadingIcon) : null,
        title: TextFormField(
          maxLines: this.maxLines,
          validator: this.validator,
          obscureText: this.obscureText,
          keyboardType: this.keyboardType,
          textInputAction: this.textInputAction,
          focusNode: this.focusNode,
          onFieldSubmitted: this.onFieldSubmitted,
          onSaved: this.onFieldSaved,
          onChanged: this.onChanged,
          decoration: InputDecoration(
            hintText: this.hintText,
            labelText: this.labelText,
            errorStyle: textStyle.copyWith(
              color: Colors.red,
            ),
          ),
          style: textStyle,
        ),
      ),
    );
  }
}
