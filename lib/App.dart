import 'package:flutter/material.dart';
import 'package:online_exam_app/constants/routes.dart';
import 'package:online_exam_app/views/pages/auth/login_page.dart';

import 'package:online_exam_app/views/pages/home_page.dart';
import 'package:online_exam_app/views/pages/onboarding_screen.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model/scoped/main.dart';

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final MainModel _model = MainModel();
  bool _isAuthenticated = false;

  @override
  void initState() {
    //user authentication
    _model.autoAuthenicate().then((status) {
      setState(() {
        _isAuthenticated = status;
        print('++++++++++++++++++++++++++');
        print(_isAuthenticated);
        print('++++++++++++++++++++++++++');
      });
    });

    _model.userSubject.listen((status) {
      _isAuthenticated = status;
    });

    _model.initializeSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online Exam APP',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: _model.isNewToApp
            ? OnboardingScreen()
            : _isAuthenticated ? HomePage() : LoginPage(),
        routes: {
          landingPageRoute: (context) =>
              _isAuthenticated ? HomePage() : LoginPage(),
        },
      ),
      model: _model,
    );
  }
}
