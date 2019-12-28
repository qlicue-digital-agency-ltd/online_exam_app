import 'package:flutter/material.dart';

import 'package:online_exam_app/model/subject.dart';
import 'package:online_exam_app/views/components/cards/dashboard_card.dart';
import 'package:online_exam_app/views/components/cards/subject_card.dart';
import 'package:online_exam_app/views/pages/drawer_page.dart';
import 'package:online_exam_app/views/pages/paper_page.dart';

class HomePage extends StatelessWidget {
  final double _appBarHeight = 150.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                    // Container(
                    //   height: _appBarHeight,
                    //   decoration: BoxDecoration(
                    //       color: Colors.green[500],
                    //       borderRadius: BorderRadius.only(
                    //           bottomLeft: Radius.circular(80),
                    //           bottomRight: Radius.circular(80))),
                    // ),
                    // This gradient ensures that the toolbar icons are distinct
                    // against the background image.
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, -0.4),
                          colors: <Color>[Color(0x60000000), Color(0x00000000)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.person),
                  tooltip: 'Add new entry',
                  onPressed: () {/* ... */},
                ),
              ]),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0), child: DashboardCard())
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SubjectCard(
                  icon: subjectList[index].icon,
                  title: subjectList[index].title,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PaperPage(
                                subject: subjectList[index],
                              ))),
                ),
              );
            }, childCount: subjectList.length),
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
                    'Subscribe',
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
          child: DrawerPage()),
    );
  }
}
