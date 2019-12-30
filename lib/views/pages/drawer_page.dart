import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/pages/my_results_page.dart';
import 'package:online_exam_app/views/pages/past_paper_page.dart';
import 'package:online_exam_app/views/pages/rank_page.dart';
import 'package:scoped_model/scoped_model.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return Container(
          child: Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    currentAccountPicture: Image.asset('assets/icon/boy.png'),
                    accountEmail: Text('developer@qlicue.co.tz'),
                    accountName: Text('John Poss'),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => RankPage()));
                    },
                    leading: Icon(
                      Icons.filter_1,
                      color: Colors.green,
                    ),
                    title: Text('Rank Board'),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PastPaperPage()));
                    },
                    leading: Icon(
                      Icons.book,
                      color: Colors.green,
                    ),
                    title: Text('Past Papers'),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => MyResultsPage(
                                    model: model,
                                  )));
                    },
                    leading: Icon(
                      Icons.folder_open,
                      color: Colors.green,
                    ),
                    title: Text('My Results'),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.green,
                    ),
                    title: Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
