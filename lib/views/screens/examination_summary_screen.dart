import 'package:flutter/material.dart';
import 'package:online_exam_app/constants/enums.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/buttons/custom_double_buttons.dart';

class ExaminationSummaryScreen extends StatelessWidget {
  final MainModel model;

  const ExaminationSummaryScreen({Key key, @required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              'Summary',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/icon/bookshow.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'Total Questions Attempted',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              model.getAttempedQuestions()['count'].toString() +
                  ' / ' +
                  model.availableQuestions.length.toString(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/icon/star.png'),
            Text('Congraturations',
                style: TextStyle(fontSize: 18, color: Colors.green)),
            CustomDoubleButtons(
              titleButtonOne: 'Preview',
              titleButtonTwo: 'Submit',
              buttonOneTap: () {
                model.chageExamStatus(ExamStatus.OPENED);
              },
              buttonTwoTap: () {
                double _score = model.getAttempedQuestions()['score'] /
                    model.availableQuestions.length *
                    100;

                model.setTotalScore = _score.round();
                model
                    .postStudentResults(
                        examId: model.availableQuestions.first.examId,
                        score: _score.round(),
                        studentId: model.selectedStudent.id)
                    .then((onValue) {
                  model.chageExamStatus(ExamStatus.CLOSED);
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
