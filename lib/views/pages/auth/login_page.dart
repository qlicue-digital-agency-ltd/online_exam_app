import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_exam_app/constants/routes.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/animations/flip_card.dart';
import 'package:online_exam_app/views/components/cards/login_form_cards.dart';
import 'package:online_exam_app/views/components/cards/sign_up_form_card.dart';
import 'package:online_exam_app/views/components/icons/custom_icons.dart';
import 'package:online_exam_app/views/components/icons/social_icon.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FlipCardState> animatedStateKey = GlobalKey<FlipCardState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: true,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Image.asset("assets/image_01.png"),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Image.asset("assets/image_02.png")
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/logo.png",
                            width: ScreenUtil.getInstance().setWidth(110),
                            height: ScreenUtil.getInstance().setHeight(110),
                          ),
                          Text("LOGO",
                              style: TextStyle(
                                  fontFamily: "Poppins-Bold",
                                  fontSize: ScreenUtil.getInstance().setSp(46),
                                  letterSpacing: .6,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(180),
                      ),
                      Container(
                        constraints: BoxConstraints.expand(
                            height: ScreenUtil.getInstance().setHeight(500)),
                        child: FlipCard(
                          key: animatedStateKey,
                          front: SignInFormCard(
                            rotatedTurnsValue: 0,
                            model: model,
                            scaffoldKey: _scaffoldKey,
                          ),
                          back: SignUpFormCard(
                            model: model,
                          ),
                          model: model,
                        ),
                      ),
                      SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          model.isFront
                              ? Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 12.0,
                                    ),
                                    GestureDetector(
                                      onTap: _radio,
                                      child: radioButton(_isSelected),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text("Remember me",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Poppins-Medium")),
                                    SizedBox(
                                      width: 12.0,
                                    ),
                                  ],
                                )
                              : Container(),
                          Expanded(
                            child: InkWell(
                              child: Container(
                                width: ScreenUtil.getInstance().setWidth(330),
                                height: ScreenUtil.getInstance().setHeight(100),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF17ead9),
                                      Colors.green
                                    ]),
                                    borderRadius: BorderRadius.circular(6.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color(0xFF6078ea).withOpacity(.3),
                                          offset: Offset(0.0, 8.0),
                                          blurRadius: 8.0)
                                    ]),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      model.isFront
                                          ? _onLoginUser(model: model)
                                          : _onSignUpUser(model: model);
                                    },
                                    child: Center(
                                      child: Text(
                                          model.isFront ? "SIGNIN" : "SIGNUP",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 18,
                                              letterSpacing: 1.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          horizontalLine(),
                          Text("Social Login",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: "Poppins-Medium")),
                          horizontalLine()
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(40),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SocialIcon(
                            colors: [
                              Color(0xFF102397),
                              Color(0xFF187adf),
                              Color(0xFF00eaf8),
                            ],
                            iconData: CustomIcons.facebook,
                            onPressed: () {},
                          ),
                          SocialIcon(
                            colors: [
                              Color(0xFFff4f38),
                              Color(0xFFff355d),
                            ],
                            iconData: CustomIcons.googlePlus,
                            onPressed: () {},
                          ),
                          SocialIcon(
                            colors: [
                              Color(0xFF17ead9),
                              Color(0xFF6078ea),
                            ],
                            iconData: CustomIcons.twitter,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            model.isFront ? "New User? " : "",
                            style: TextStyle(fontFamily: "Poppins-Medium"),
                          ),
                          InkWell(
                            onTap: () {
                              model.flipCard = model.isFront;
                            },
                            child: Text(model.isFront ? "SignUp" : 'SignIn',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontFamily: "Poppins-Bold")),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _onSignUpUser({MainModel model}) {
    final _phone = '+' +
        model.selectedCountry.dialingCode +
        model.mobileSignUpEditingController.text
            .replaceAll('(', '')
            .replaceAll(')', '')
            .replaceAll('-', '')
            .replaceAll(' ', '');

    if (model.signUpFormKey.currentState.validate()) {
      model
          .authenticateUser(
        password: model.passwordSignUpTextEditingController.text,
        phone: _phone,
        url: 'register',
      )
          .then((value) {
        print('YYYYYYYYYYYY');
        print(value);
        print('XXXXXXXXXXXXXXXXXXXXXXXXXX');
        if (value) {
          model.passwordSignUpTextEditingController.clear();

          model.mobileSignUpEditingController.clear();

          model.confirmSignUpPasswordTextEditingController.clear();
          model.flipCard = false;

          //show the snackbar
          model.showInSnackBar(
              color: Colors.white,
              context: context,
              icon: FontAwesomeIcons.checkCircle,
              scaffoldKey: _scaffoldKey,
              title: 'User registration sucessful');

          Navigator.pushReplacementNamed(context, landingPageRoute);
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

  void _onLoginUser({MainModel model}) {
    final _phone = '+' +
        model.selectedCountry.dialingCode +
        model.mobileEditingController.text
            .replaceAll('(', '')
            .replaceAll(')', '')
            .replaceAll('-', '')
            .replaceAll(' ', '');

    if (model.signInFormKey.currentState.validate()) {
      model
          .authenticateUser(
        password: model.passwordTextEditingController.text,
        phone: _phone,
        url: 'login',
      )
          .then((value) {
        print('YYYYYYYYYYYY');
        print(value);
        print('XXXXXXXXXXXXXXXXXXXXXXXXXX');
        if (value) {
          model.passwordTextEditingController.clear();
          model.mobileEditingController.clear();

          //show the snackbar
          model.showInSnackBar(
              color: Colors.white,
              context: context,
              icon: FontAwesomeIcons.checkCircle,
              scaffoldKey: _scaffoldKey,
              title: 'User Login sucessful');

          Navigator.pushReplacementNamed(context, landingPageRoute);
        } else {
          //show the snackbar
          model.showInSnackBar(
              color: Colors.red,
              context: context,
              icon: Icons.error,
              scaffoldKey: _scaffoldKey,
              title: 'Error while signing in');
        }
      });
    }
  }
}
