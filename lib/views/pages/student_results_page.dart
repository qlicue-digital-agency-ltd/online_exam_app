import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/cards/student_results_card.dart';
import 'package:scoped_model/scoped_model.dart';

class StudentResultsPage extends StatefulWidget {
  final MainModel model;

  const StudentResultsPage({Key key, @required this.model}) : super(key: key);
  @override
  _StudentResultsPageState createState() => _StudentResultsPageState();
}

class _StudentResultsPageState extends State<StudentResultsPage> {
  @override
  void initState() {
    widget.model
        .fetchStudentsResults(studentId: widget.model.authenticatedUser.id);
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
                    child: StudentResultsCard(
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
