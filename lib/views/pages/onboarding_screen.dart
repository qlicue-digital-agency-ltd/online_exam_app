import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/styles/style.dart';
import 'package:scoped_model/scoped_model.dart';

import 'auth/login_page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF05ff73),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.4, 0.7, 0.9],
                  colors: [
                    Color(0xFF35de9a),
                    Color(0xFF45db6d),
                    Color(0xFF36d165),
                    Color(0xFF0e9e4d),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _currentPage = _numPages - 1;
                            _pageController.jumpToPage(_currentPage);
                            
                          });
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 600.0,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/onboarding0.png',
                                    ),
                                    height: 300.0,
                                    width: 300.0,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Text(
                                  'Self Preparation Examination',
                                  style: kTitleStyle,
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: kSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/onboarding1.png',
                                    ),
                                    height: 300.0,
                                    width: 300.0,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Text(
                                  'For primary Level pupils',
                                  style: kTitleStyle,
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: kSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      'assets/images/onboarding2.png',
                                    ),
                                    height: 300.0,
                                    width: 300.0,
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Text(
                                  'Challange yourself amongst other students',
                                  style: kTitleStyle,
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  style: kSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    _currentPage != _numPages - 1
                        ? Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomRight,
                              child: FlatButton(
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        : Text(''),
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: _currentPage == _numPages - 1
              ? Container(
                  height: 100.0,
                  width: double.infinity,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      model.setIsNewToAppStatus = false;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()));
                    },
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: Text(
                          'Get started',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Text(''),
        );
      },
    );
  }
}
