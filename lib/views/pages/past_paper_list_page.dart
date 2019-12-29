import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/model/subject.dart';

import 'package:online_exam_app/views/components/cards/past_paper_list_card.dart';
import 'package:scoped_model/scoped_model.dart';

class PastPaperListPage extends StatelessWidget {
  final Subject subject;

  const PastPaperListPage({Key key, @required this.subject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(subject.name),
          ),
          body: ListView.builder(
            itemCount: subject.examinations.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: PastPaperListCard(
                examination: subject.examinations[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
