import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/text_fields/confirm_password.dart';
import 'package:online_exam_app/views/components/text_fields/password_field.dart';
import 'package:online_exam_app/views/components/text_fields/phone_number_text_field.dart';

class SignUpFormCard extends StatefulWidget {
  final MainModel model;

  SignUpFormCard({
    Key key,
    @required this.model,
  }) : super(key: key);

  @override
  _SignUpFormCardState createState() => _SignUpFormCardState();
}

class _SignUpFormCardState extends State<SignUpFormCard> {
  final GlobalKey<FormFieldState> _formFieldKey = GlobalKey<FormFieldState>();
  String passwordText = '';
  bool _passwordMatch = false;

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
        child: Form(
          key: widget.model.signUpFormKey,
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
                focusNode: widget.model.mobileSignUpFocusNode,
                textEditingController:
                    widget.model.mobileSignUpEditingController,
                keyboardType: TextInputType.number,
                selectedCountry: widget.model.selectedCountry,
                onCodeChange: (country) {
                 
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
                focusNode: widget.model.passwordSignUpFocusNode,
                textEditingController:
                    widget.model.passwordSignUpTextEditingController,
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
                message: null,
                maxLines: 1,
                hitText: 'Confirm Password',
                prefixIcon: Icons.lock,
                formFieldKey: _formFieldKey,
                labelText: null,
                focusNode: widget.model.confirmPasswordSignUpFocusNode,
                password: passwordText,
                textEditingController:
                    widget.model.confirmSignUpPasswordTextEditingController,
                keyboardType: TextInputType.text,
                onChange: (val) {
                  // setState(() {
                  //   _passwordMatch = _formFieldKey.currentState.validate();
                  //   if (passwordText == val) {
                  //     _passwordMatch = true;
                  //   } else {
                  //     _passwordMatch = false;
                  //   }
                  // });
                 
                },
                passMatch: _passwordMatch,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
