import 'package:flutter/material.dart';

import 'package:online_exam_app/views/pages/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model/scoped/main.dart';

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final MainModel _model = MainModel();

  @override
  void initState() {
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
        home: HomePage(),
      ),
      model: _model,
    );
  }
}
