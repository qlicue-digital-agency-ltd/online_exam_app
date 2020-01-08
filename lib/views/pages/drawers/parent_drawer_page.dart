import 'package:flutter/material.dart';
import 'package:online_exam_app/constants/routes.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/pages/terms_condition.dart';
import 'package:scoped_model/scoped_model.dart';

import '../help_page.dart';

class ParentDrawerPage extends StatelessWidget {
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
                      currentAccountPicture: CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/male.jpg')),
                      accountEmail: Text("+" + model.authenticatedUser.phone),
                      accountName: Text('John Poss'),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => RankPage(
                      //               model: model,
                      //             )));
                    },
                    leading: Icon(
                      Icons.person_outline,
                      color: Colors.green,
                    ),
                    title: Text('Profile'),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HelpPage()));
                    },
                    leading: Icon(
                      Icons.help,
                      color: Colors.green,
                    ),
                    title: Text('Help'),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TermConditionPage()));
                    },
                    leading: Icon(
                      Icons.blur_linear,
                      color: Colors.green,
                    ),
                    title: Text('Terms & Conditions'),
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
