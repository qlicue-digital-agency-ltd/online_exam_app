import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/cards/past_paper_card.dart';
import 'package:online_exam_app/views/components/tiles/no_item.dart';
import 'package:scoped_model/scoped_model.dart';

class PastPaperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Past Papers'),
          ),
          body: model.availableSubjects.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      itemCount: model.availableSubjects.length,
                      gridDelegate:
                          new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5),
                      itemBuilder: (BuildContext context, int index) =>
                          PastPaperCard(
                            subject: model.availableSubjects[index],
                            model: model,
                            index: index,
                          )),
                )
              : Container(
                  child: Center(
                    child: NoItemTile(
                      icon: 'assets/icon/trophy.png',
                      title: 'Hello, ' + model.selectedStudent.name,
                      subtitle: 'You have no past papers yet. ',
                    ),
                  ),
                ),
        );
      },
    );
  }
}
