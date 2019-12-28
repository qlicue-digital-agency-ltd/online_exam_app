import 'package:flutter/material.dart';
import 'package:online_exam_app/model/subject.dart';

import 'my_results_card.dart';

class MyResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Results'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyResultsCard(
            subject: subjectList[2],
          ),
        ),
      ),
    );
  }
}
