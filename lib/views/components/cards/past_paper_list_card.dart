import 'package:flutter/material.dart';

import 'package:online_exam_app/model/examination.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/pages/past_papers/marking_scheme_page.dart';

class PastPaperListCard extends StatelessWidget {
  final Examination examination;
  final MainModel model;

  const PastPaperListCard(
      {Key key, @required this.examination, @required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        model.setAvailableExamination = examination.subjectId;
        model.setAvailableQuestions = examination.id;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MarkingSchemePage(
                      model: model,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(15)),
        height: 80,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/icon/book.png',
                height: 40,
              ),
            ),
            VerticalDivider(
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
                child: Text(examination.examNo,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                model.getScoreByExamId(examId: examination.id).toString() +
                    " %",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
