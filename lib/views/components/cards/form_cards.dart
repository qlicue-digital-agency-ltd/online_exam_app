import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/text_fields/password_field.dart';
import 'package:online_exam_app/views/components/text_fields/phone_number_text_field.dart';

class FormCard extends StatefulWidget {
  final MainModel model;

  FormCard({Key key, @required this.model}) : super(key: key);

  @override
  _FormCardState createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  FocusNode _mobileFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  TextEditingController _mobileEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  String passwordText = '';

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
            Text("Login",
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
              height: ScreenUtil.getInstance().setHeight(35),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: "Poppins-Medium",
                      fontSize: ScreenUtil.getInstance().setSp(28)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
