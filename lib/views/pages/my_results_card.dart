import 'package:flutter/material.dart';
import 'package:online_exam_app/model/subject.dart';
import 'package:online_exam_app/views/pages/paper_page.dart';

class MyResultsCard extends StatelessWidget {
  final Subject subject;

  const MyResultsCard({Key key, @required this.subject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.pink, borderRadius: BorderRadius.circular(15)),
        height: 80,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                'assets/icon/abacus.png',
                height: 40,
              ),
            ),
            VerticalDivider(
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
                child: Text("ENGLISH\n20/12/2019",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Position: 5/30",
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
