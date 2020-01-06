import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/cards/student_card.dart';
import 'package:online_exam_app/views/components/tiles/no_item.dart';
import 'package:online_exam_app/views/pages/create_student.dart';
import 'package:online_exam_app/views/pages/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

class StudentPage extends StatefulWidget {
  final MainModel model;

  const StudentPage({Key key, @required this.model}) : super(key: key);
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  void initState() {
    widget.model.fetchStudentsByGuardian();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Students'),
          actions: <Widget>[
            IconButton(
              tooltip: 'Add Student',
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new CreateStudent();
                    },
                    fullscreenDialog: true));
              },
            )
          ],
        ),
        body: ScopedModelDescendant(
          builder: (BuildContext context, Widget child, MainModel model) {
            return model.availableStudents.isNotEmpty
                ? RefreshIndicator(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) =>
                          index < 10
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: StudentCard(
                                    student: model.availableStudents[index],
                                    onTap: () {
                                      return Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) {
                                        return HomePage();
                                      }));
                                    },
                                  ),
                                )
                              : Container(),
                      itemCount: model.availableStudents.length,
                    ),
                    onRefresh: () => _onRefresh(model),
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

  _onRefresh(MainModel model) async {
    await model.fetchStudentsByGuardian();
  }
}
