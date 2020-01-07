import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';

import 'package:online_exam_app/views/components/cards/dashboard_card.dart';
import 'package:online_exam_app/views/components/cards/subject_card.dart';
import 'package:online_exam_app/views/components/tiles/no_item.dart';
import 'package:online_exam_app/views/pages/paper_page.dart';
import 'package:scoped_model/scoped_model.dart';

import 'drawers/student_drawer_page.dart';

class StudentPage extends StatefulWidget {
  final MainModel model;

  const StudentPage({Key key, @required this.model}) : super(key: key);
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final double _appBarHeight = 150.0;
  @override
  void initState() {
    widget.model
        .fetchStudentsResults(studentId: widget.model.selectedStudent.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                  floating: true,
                  pinned: true,
                  expandedHeight: _appBarHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(model.selectedStudent.name),
                    background: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Container(
                          height: _appBarHeight,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.blue[300],
                                Colors.green,
                              ]),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                        ),
                        // This gradient ensures that the toolbar icons are distinct
                        // against the background image.
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.0, -1.0),
                              end: Alignment(0.0, -0.4),
                              colors: <Color>[
                                Color(0x60000000),
                                Color(0x00000000)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          print('object');
                        },
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              model.selectedStudent.gender.toLowerCase() ==
                                      'male'
                                  ? 'assets/icon/boy.png'
                                  : 'assets/icon/girl.png'),
                        ),
                      ),
                    )
                  ]),
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DashboardCard(
                        results: model.availableResults,
                        model: model,
                      ))
                ]),
              ),
              model.availableSubjects.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SubjectCard(
                              subject: model.availableSubjects[index],
                              icon: model.getSubjectAvatar(
                                  code: model.availableSubjects[index].code
                                      .toUpperCase()),
                              onTap: () {
                                //step one.. set available exam
                                model.setAvailableExamination =
                                    model.availableSubjects[index].id;

                                ///step two..  check whether the exam has been done by this student
                                model
                                    .checkForExaminationVsStudentStatus(
                                        examId: model.currentExamination.id,
                                        studentId: model.selectedStudent.id)
                                    .then((onValue) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              PaperPage(
                                                model: model,
                                              )));
                                });
                              }),
                        );
                      }, childCount: model.availableSubjects.length),
                    )
                  : SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                          child: NoItemTile(
                            icon: 'assets/icon/books.png',
                            title: 'Hello!',
                            subtitle: 'There are no Exams for ' +
                                model
                                    .getGradeById(
                                        gradeId: model.selectedStudent.gradeId)
                                    .name +
                                ' of yet',
                          ),
                        )
                      ]),
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
                          borderRadius: BorderRadius.circular(6.0),
                          gradient: LinearGradient(colors: [
                            Colors.blue[300],
                            Colors.green,
                          ]),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF6078ea).withOpacity(.3),
                                offset: Offset(0.0, 8.0),
                                blurRadius: 8.0)
                          ]),
                      height: 50,
                      child: Center(
                          child: Text(
                        'Subscribe'.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: Container(
              width: MediaQuery.of(context).size.width * .85,
              child: StudentDrawerPage()),
        );
      },
    );
  }
}
