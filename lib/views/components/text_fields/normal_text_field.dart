import 'package:flutter/material.dart';

typedef LabelTextfieldOnChange = Function(String);

class NoramalTextfield extends StatelessWidget {
  final String hitText;
  final String labelText;
  final int maxLines;
  final String message;

  final IconData prefixIcon;

  final TextInputType keyboardType;
  final LabelTextfieldOnChange onChange;
  final GlobalKey<FormFieldState> formFieldKey;

  final FocusNode focusNode;

  final TextEditingController textEditingController;

  NoramalTextfield(
      {Key key,
      @required this.hitText,
      @required this.labelText,
      @required this.focusNode,
      @required this.textEditingController,
      @required this.maxLines,
      @required this.message,
      @required this.keyboardType,
      this.onChange,
      this.formFieldKey,
      this.prefixIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      keyboardType: keyboardType,
      focusNode: focusNode,
      key: formFieldKey,
      controller: textEditingController,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hitText,
        labelText: labelText,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Theme.of(context).primaryColor,
              )
            : null,
      ),
      validator: (value) {
        if (message != null) {
          if (value.isEmpty) {
            return "\t\t\t\t\t\t\t\t\t\t\t\t\t\t" + message;
          } else
            return null;
        } else
          return null;
      },
    );
  }
}
