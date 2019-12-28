import 'package:flutter/material.dart';
import 'package:online_exam_app/model/subject.dart';
import 'package:online_exam_app/views/components/cards/past_paper_list_card.dart';

class PastPaperListPage extends StatelessWidget {
  final Subject subject;

  const PastPaperListPage({Key key, @required this.subject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.title),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: PastPaperListCard(
            subject: subject,
          ),
        ),
      ),
    );
  }
}
