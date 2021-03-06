import 'package:flutter/material.dart';
import 'package:online_exam_app/constants/routes.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/pages/past_papers/past_paper_page.dart';
import 'package:online_exam_app/views/pages/rank_page.dart';
import 'package:online_exam_app/views/pages/student_results_page.dart';
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
                  Container(
                    child: UserAccountsDrawerHeader(
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
                      currentAccountPicture: Image.asset('assets/icon/boy.png'),
                      accountEmail: Text('developer@qlicue.co.tz'),
                      accountName: Text('John Poss'),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => RankPage(
                                    model: model,
                                  )));
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
                              builder: (BuildContext context) =>
                                  StudentResultsPage(
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
                      model.logout().then((onValue) {
                        Navigator.pushReplacementNamed(
                            context, landingPageRoute);
                      });
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
