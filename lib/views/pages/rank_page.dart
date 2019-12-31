import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/screens/rank_board_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class RankPage extends StatefulWidget {
  final MainModel model;

  const RankPage({Key key, @required this.model}) : super(key: key);
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  List<Tab> _tabs = [];
  List<Widget> _screens = [];
  @override
  void initState() {
    widget.model.availableSubjects.forEach((subject) {
      _tabs.add(Tab(
        text: subject.name,
      ));

      _screens.add(RankBoardScreen());
       
    });
    onTap(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return DefaultTabController(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Rank Board'),
              bottom: TabBar(
                onTap: onTap,
                isScrollable: true,
                tabs: _tabs,
              ),
            ),
            body: TabBarView(
              children: _screens,
            ),
          ),
          length: model.availableSubjects.length,
        );
      },
    );
  }

  void onTap(int index) {
    print(index);
    print(widget.model.availableSubjects[index].examinations.first.id);
    widget.model.fetchTopTenStudents(
        examId: widget.model.availableSubjects[index].examinations.first.id);
  }
}
