import 'package:flutter/material.dart';
import 'package:online_exam_app/views/screens/rank_board_screen.dart';

class RankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Rank Board'),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'English',
              ),
              Tab(
                text: 'Science',
              ),
              Tab(
                text: 'Mathematics',
              ),
              Tab(
                text: 'Swahili',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            RankBoardScreen(),
            RankBoardScreen(),
            RankBoardScreen(),
            RankBoardScreen(),
          ],
        ),
      ),
      length: 4,
    );
  }
}
