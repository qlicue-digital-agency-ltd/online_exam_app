import 'package:flutter/material.dart';

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
      ),
      length: 4,
    );
  }
}
