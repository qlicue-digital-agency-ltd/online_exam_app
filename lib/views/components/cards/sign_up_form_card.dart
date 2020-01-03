import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/text_fields/confirm_password.dart';
import 'package:online_exam_app/views/components/text_fields/password_field.dart';
import 'package:online_exam_app/views/components/text_fields/phone_number_text_field.dart';

class SignUpFormCard extends StatefulWidget {
  final MainModel model;

  SignUpFormCard({Key key, @required this.model}) : super(key: key);

  @override
  _SignUpFormCardState createState() => _SignUpFormCardState();
}

class _SignUpFormCardState extends State<SignUpFormCard> {
  FocusNode _mobileFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();

  TextEditingController _mobileEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();

  final GlobalKey<FormFieldState> _formFieldKey = GlobalKey<FormFieldState>();
  String passwordText = '';
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(500),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 15.0),
                blurRadius: 15.0),
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, -10.0),
                blurRadius: 10.0),
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Sign Up",
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().setSp(45),
                    fontFamily: "Poppins-Bold",
                    letterSpacing: .6)),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("Phone Number",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            PhoneNumberTextfield(
              message: 'Please enter Mobile Number',
              maxLines: 1,
              hitText: 'Phone Number',
              labelText: null,
              focusNode: _mobileFocusNode,
              textEditingController: _mobileEditingController,
              keyboardType: TextInputType.number,
              selectedCountry: widget.model.selectedCountry,
              onCodeChange: (country) {
                print(country);
                widget.model.setSelectedCountry = country;
              },
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Text("PassWord",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    fontSize: ScreenUtil.getInstance().setSp(26))),
            PasswordLabelTextfield(
              prefixIcon: Icons.lock,
              message: 'Please enter Password',
              maxLines: 1,
              hitText: 'Password',
              labelText: null,
              focusNode: _passwordFocusNode,
              textEditingController: _passwordTextEditingController,
              keyboardType: TextInputType.text,
              password: null,
              onChange: (value) {
                setState(() {
                  passwordText = value;
                });
              },
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            ConfirmPasswordLabelTextfield(
              message: 'Make sure passwords do match',
              maxLines: 1,
              hitText: 'Confirm Password',
              prefixIcon: Icons.lock,
              formFieldKey: _formFieldKey,
              labelText: null,
              focusNode: _confirmPasswordFocusNode,
              password: passwordText,
              textEditingController: _confirmPasswordTextEditingController,
              keyboardType: TextInputType.text,
              onChange: (val) {
                _formFieldKey.currentState.validate();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onSave(MainModel model) {
    final _phone = model.selectedCountry.dialingCode +
        _mobileEditingController.text
            .replaceAll('(', '')
            .replaceAll(')', '')
            .replaceAll('-', '')
            .replaceAll(' ', '');

    if (_formKey.currentState.validate()) {
      model
          .signUpUser(
        password: _passwordTextEditingController.text,
        phone: _phone,
      )
          .then((value) {
        if (value) {
          _passwordTextEditingController.clear();

          _mobileEditingController.clear();

          _confirmPasswordTextEditingController.clear();

          //show the snackbar
          model.showInSnackBar(
              color: Colors.white,
              context: context,
              icon: FontAwesomeIcons.checkCircle,
              scaffoldKey: _scaffoldKey,
              title: 'Admin created sucessfully');

          Navigator.pushReplacementNamed(context, tokenPageRoute);
        } else {
          //show the snackbar
          model.showInSnackBar(
              color: Colors.red,
              context: context,
              icon: Icons.error,
              scaffoldKey: _scaffoldKey,
              title: 'Error while signing up');
        }
      });
    }
  }
}
