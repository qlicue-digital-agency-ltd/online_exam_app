import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef LabelTextfieldOnChange = Function(String);

class ConfirmPasswordLabelTextfield extends StatefulWidget {
  final String hitText;
  final String labelText;
  final int maxLines;
  final String message;
  final String password;
  final IconData prefixIcon;

  final TextInputType keyboardType;
  final LabelTextfieldOnChange onChange;
  final GlobalKey<FormFieldState> formFieldKey;

  final FocusNode focusNode;

  final TextEditingController textEditingController;

  ConfirmPasswordLabelTextfield(
      {Key key,
      @required this.hitText,
      @required this.labelText,
      @required this.focusNode,
      @required this.textEditingController,
      @required this.maxLines,
      @required this.message,
      @required this.keyboardType,
      this.password,
      this.onChange,
      this.formFieldKey,
      this.prefixIcon})
      : super(key: key);

  @override
  _ConfirmPasswordLabelTextfieldState createState() =>
      _ConfirmPasswordLabelTextfieldState();
}

class _ConfirmPasswordLabelTextfieldState
    extends State<ConfirmPasswordLabelTextfield> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChange,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      key: widget.formFieldKey,
      controller: widget.textEditingController,
      maxLines: widget.maxLines,
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: widget.hitText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: Theme.of(context).primaryColor,
              )
            : null,
        suffixIcon: InkWell(
          splashColor: Theme.of(context).primaryColor,
          highlightColor: Colors.transparent,
          child: Icon(
              _isObscure ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash),
          onTap: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
      ),
      validator: (value) {
        print(value);
        print(widget.password);
        if (value != widget.password) {
          return "\t\t\t\t\t\t\t\t\t\t\t\t\t\t" + widget.message;
        } else
          return null;
      },
    );
  }
}
