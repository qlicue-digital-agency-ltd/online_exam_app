import 'package:flutter/material.dart';
import 'package:online_exam_app/model/examination.dart';

import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/buttons/custom_double_buttons.dart';
import 'package:online_exam_app/views/components/cards/answer_card.dart';
import 'package:online_exam_app/views/components/cards/exam_header_card.dart';
import 'package:online_exam_app/views/components/cards/question_card.dart';
import 'package:online_exam_app/views/screens/examination_summary_screen.dart';
import 'package:online_exam_app/views/screens/result_board_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class PaperPage extends StatefulWidget {
  final Examination examination;
  final MainModel model;

  const PaperPage({Key key, @required this.examination, @required this.model})
      : super(key: key);

  @override
  _PaperPageState createState() => _PaperPageState();
}

class _PaperPageState extends State<PaperPage> {
  @override
  void initState() {
    widget.model.setAvailableQuestions = widget.examination.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        var scaffold = Scaffold(
          appBar: AppBar(
            title: Text(model
                .getSubjectById(subjectId: widget.examination.subjectId)
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
                              examination: widget.examination,
                            ),
                            Divider(
                              color: Colors.green,
                            ),
                            QuestionCard(
                              question: model.currentQuestion,
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
                    child: AnswerCard(
                      answer: model.availableAnswers[index],
                      onTap: () {
                        model.setPreferredAnswer =
                            model.availableAnswers[index].id;
                      },
                    ),
                  );
                }, childCount: model.availableAnswers.length),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                    [ExaminationSummaryScreen(), ResultBoardScren()]),
              )
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
              if (model.currentQuestion.id !=
                  model.availableQuestions.last.id) {
                model.nextQuestion();
              }
            },
          )),
        );
        return scaffold;
      },
    );
  }
}
