import 'package:flutter/material.dart';
import 'package:online_exam_app/components/cards/answer_card.dart';

import 'package:online_exam_app/model/answer.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/model/subject.dart';
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
                            Row(
                              children: <Widget>[
                                Expanded(child: Text('Question: 50')),
                                Expanded(
                                    child: Text(
                                  '02:00 hrs',
                                  textAlign: TextAlign.end,
                                ))
                              ],
                            ),
                            Divider(
                              color: Colors.green,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: Text(
                                        '1. Chocolate lemon drops muffin tart croissant sugar plum jelly-o lemon drops chocolate cake. Pie topping cupcake apple pie tootsie roll lemon drops. Pudding cupcake chocolate cake tiramisu gummies sweet halvah topping fruitcake. ?')),
                              ],
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
              )
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green[500],
                          borderRadius: BorderRadius.circular(10)),
                      height: 50,
                      child: Center(
                          child: Text(
                        'NEXT',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
