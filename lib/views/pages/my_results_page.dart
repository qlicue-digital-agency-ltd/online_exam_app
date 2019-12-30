import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:scoped_model/scoped_model.dart';

import 'my_results_card.dart';

class MyResultsPage extends StatefulWidget {
  final MainModel model;

  const MyResultsPage({Key key, @required this.model}) : super(key: key);
  @override
  _MyResultsPageState createState() => _MyResultsPageState();
}

class _MyResultsPageState extends State<MyResultsPage> {
  @override
  void initState() {
    widget.model.fetchStudentsResults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('My Results'),
          ),
          body: model.availableResults.isNotEmpty
              ? ListView.builder(
                  itemCount: model.availableResults.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyResultsCard(
                      result: model.availableResults[index],
                      model: model,
                    ),
                  ),
                )
              : Container(
                  child: Center(
                    child: Text('You have no results yet'),
                  ),
                ),
        );
      },
    );
  }
}
