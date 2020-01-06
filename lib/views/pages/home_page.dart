import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/cards/student_card.dart';
import 'package:online_exam_app/views/components/tiles/no_item.dart';
import 'package:online_exam_app/views/pages/student_page.dart';
import 'package:scoped_model/scoped_model.dart';

import 'create_student.dart';
import 'drawers/parent_drawer_page.dart';

class HomePage extends StatefulWidget {
  final MainModel model;

  const HomePage({Key key, @required this.model}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _appBarHeight = 150.0;
  @override
  void initState() {
    widget.model
        .fetchStudentsByGuardian(userId: widget.model.authenticatedUser.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant(
        builder: (BuildContext context, Widget child, MainModel model) {
          return RefreshIndicator(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  expandedHeight: _appBarHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text('SPE APP'),
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
                SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('STUDENTS'))
                  ]),
                ),
                model.availableStudents.isNotEmpty
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StudentCard(
                              student: model.availableStudents[index],
                              onTap: () {
                                model.setSelectedStudent =
                                    model.availableStudents[index];
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) {
                                  return StudentPage();
                                }));
                              },
                            ),
                          );
                        }, childCount: model.availableStudents.length),
                      )
                    : SliverList(
                        delegate: SliverChildListDelegate([
                         NoItemTile(
                                icon: 'assets/icon/boy.png',
                                title: 'Hello!',
                                subtitle: 'Add a student',
                              )
                        ]),
                      )
              ],
            ),
            onRefresh: () => _onRefresh(model),
          );
        },
      ),
      drawer: Container(
          width: MediaQuery.of(context).size.width * .85,
          child: ParentDrawerPage()),
    );
  }

  _onRefresh(MainModel model) async {
    await model.fetchStudentsByGuardian(
        userId: widget.model.authenticatedUser.id);
  }
}
