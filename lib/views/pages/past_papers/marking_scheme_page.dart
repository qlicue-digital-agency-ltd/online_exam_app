import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/buttons/custom_double_buttons.dart';
import 'package:online_exam_app/views/components/cards/answer_marking_scheme_card.dart';
import 'package:online_exam_app/views/components/cards/exam_header_card.dart';
import 'package:online_exam_app/views/components/cards/question_card.dart';
import 'package:scoped_model/scoped_model.dart';

class MarkingSchemePage extends StatefulWidget {
  final MainModel model;

  const MarkingSchemePage({Key key, @required this.model}) : super(key: key);

  @override
  _MarkingSchemePageState createState() => _MarkingSchemePageState();
}

class _MarkingSchemePageState extends State<MarkingSchemePage> {
 

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        var scaffold = Scaffold(
            appBar: AppBar(
              title: Text(model
                  .getSubjectById(subjectId: model.currentExamination.subjectId)
                  .name),
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
                              ExamHeaderCard(
                                examination: model.currentExamination,
                              ),
                              Divider(
                                color: Colors.green,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: QuestionCard(
                                  question: model.currentQuestion,
                                ),
                              ),
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
                      child: AnswerMarkingSchemeCard(
                        answer: model.availableAnswers[index],
                       
                      ),
                    );
                  }, childCount: model.availableAnswers.length),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
                child: CustomDoubleButtons(
              titleButtonOne: 'PREV',
              titleButtonTwo: 'NEXT',
              buttonOneTap: () {
                model.previousQuestion();
              },
              buttonTwoTap: () {
                model.nextQuestion();
              },
            )));
        return scaffold;
      },
    );
  }
}
