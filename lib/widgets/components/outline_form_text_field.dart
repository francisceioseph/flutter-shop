import 'package:flutter/material.dart';

class OutlineFormTextField extends StatelessWidget {
  final FocusNode focusNode;

  final String initialValue;
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

  OutlineFormTextField({
    Key key,
    this.hintText,
    this.labelText,
    this.validator,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.onFieldSaved,
    this.onChanged,
    this.initialValue,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: TextFormField(
        initialValue: initialValue,
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
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          focusedBorder: _borderDecoration(Colors.blue),
          enabledBorder: _borderDecoration(Colors.grey),
          errorBorder: _borderDecoration(Colors.red),
          focusedErrorBorder: _borderDecoration(Colors.red),
        ),
      ),
    );
  }

  _borderDecoration(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
    );
  }
}
