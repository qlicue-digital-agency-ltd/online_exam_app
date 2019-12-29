import 'package:flutter/material.dart';
import 'package:online_exam_app/model/subject.dart';
import 'package:online_exam_app/views/pages/past_paper_list_page.dart';

class PastPaperCard extends StatelessWidget {
  final Subject subject;

  const PastPaperCard({Key key, @required this.subject}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PastPaperListPage(
                    subject: subject,
                  ))),
      child: Card(
        elevation: 5,
        color: Colors.pink,
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: Image.asset('assets/icon/books.png')),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    subject.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                )),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chip(
                  label: Text(
                    '20',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
