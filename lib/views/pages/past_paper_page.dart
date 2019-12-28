import 'package:flutter/material.dart';
import 'package:online_exam_app/model/subject.dart';
import 'package:online_exam_app/views/components/cards/past_paper_card.dart';

class PastPaperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Papers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            itemCount: subjectList.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (BuildContext context, int index) => PastPaperCard(
                  subject: subjectList[index],
                )),
      ),
    );
  }
}
