import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/model/student.dart';
import 'package:online_exam_app/views/components/cards/student_card.dart';
import 'package:online_exam_app/views/components/tiles/no_item.dart';
import 'package:scoped_model/scoped_model.dart';

class StudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Students'),
          actions: <Widget>[
            IconButton(
              tooltip: 'Add Student',
              icon: Icon(Icons.add),
              onPressed: () {},
            )
          ],
        ),
        body: ScopedModelDescendant(
          builder: (BuildContext context, Widget child, MainModel model) {
            return myStudents.isNotEmpty
                ? ListView.builder(
                    itemBuilder: (BuildContext context, int index) => index < 10
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StudentCard(
                              student: myStudents[index],
                            ),
                          )
                        : Container(),
                    itemCount: myStudents.length,
                  )
                : Container(
                    child: Center(
                      child: NoItemTile(
                        icon: 'assets/icon/boy.png',
                        title: 'Hello!',
                        subtitle: 'Add a student',
                      ),
                    ),
                  );
          },
        ));
  }
}
