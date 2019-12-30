import 'package:flutter/material.dart';
import 'package:online_exam_app/constants/enums.dart';

import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/buttons/custom_double_buttons.dart';
import 'package:online_exam_app/views/components/cards/answer_card.dart';
import 'package:online_exam_app/views/components/cards/exam_header_card.dart';
import 'package:online_exam_app/views/components/cards/question_card.dart';
import 'package:online_exam_app/views/screens/examination_summary_screen.dart';
import 'package:online_exam_app/views/screens/result_board_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class PaperPage extends StatefulWidget {
  final MainModel model;

  const PaperPage({Key key, @required this.model}) : super(key: key);

  @override
  _PaperPageState createState() => _PaperPageState();
}

class _PaperPageState extends State<PaperPage> {
  @override
  void initState() {
    widget.model.setAvailableQuestions = widget.model.currentExamination.id;
    super.initState();
  }

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
              model.currentExamination.examStatus == ExamStatus.OPENED
                  ? SliverList(
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
                    )
                  : SliverList(
                      delegate: SliverChildListDelegate([Container()]),
                    ),
              model.currentExamination.examStatus == ExamStatus.OPENED
                  ? SliverList(
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
                    )
                  : SliverList(
                      delegate: SliverChildListDelegate([Container()]),
                    ),
              SliverList(
                delegate: SliverChildListDelegate([
                  model.currentExamination.examStatus == ExamStatus.DONE
                      ? ExaminationSummaryScreen(
                          model: model,
                        )
                      : Container(),
                  model.currentExamination.examStatus == ExamStatus.CLOSED
                      ? ResultBoardScren()
                      : Container()
                ]),
              )
            ],
          ),
          bottomNavigationBar:
              model.currentExamination.examStatus == ExamStatus.OPENED
                  ? BottomAppBar(
                      child: CustomDoubleButtons(
                      titleButtonOne: 'PREV',
                      titleButtonTwo: 'NEXT',
                      buttonOneTap: () {
                        model.previousQuestion();
                      },
                      buttonTwoTap: () {
                        model.nextQuestion();
                      },
                    ))
                  : null,
        );
        return scaffold;
      },
    );
  }
}
