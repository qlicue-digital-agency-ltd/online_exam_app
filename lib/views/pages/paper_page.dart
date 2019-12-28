import 'package:flutter/material.dart';

import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/model/subject.dart';
import 'package:online_exam_app/views/components/buttons/custom_double_buttons.dart';
import 'package:online_exam_app/views/components/cards/answer_card.dart';
import 'package:online_exam_app/views/components/cards/exam_header_card.dart';
import 'package:online_exam_app/views/components/cards/question_card.dart';
import 'package:online_exam_app/views/screens/examination_summary_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class PaperPage extends StatelessWidget {
  final Subject subject;

  const PaperPage({Key key, @required this.subject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text(subject.title),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            ExamHeaderCard(),
                            Divider(
                              color: Colors.green,
                            ),
                            QuestionCard(),
                            Divider(
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ))
                ]),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnswerCard(
                      answer: model.answerList[index],
                      model: model,
                      onTap: () {
                        model.setPreferredAnswer = model.answerList[index].id;
                      },
                    ),
                  );
                }, childCount: model.answerList.length),
              ),
              SliverList(
                delegate: SliverChildListDelegate([ExaminationSummaryScreen()]),
              )
            ],
          ),
          bottomNavigationBar: BottomAppBar(child: CustomDoubleButtons(titleButtonOne: 'PREV', titleButtonTwo: 'NEXT',)),
        );
      },
    );
  }
}
