import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/model/subject.dart';
import 'package:online_exam_app/views/pages/past_paper_list_page.dart';

class PastPaperCard extends StatelessWidget {
  final Subject subject;
  final MainModel model;
  final int index;

  const PastPaperCard(
      {Key key,
      @required this.subject,
      @required this.model,
      @required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PastPaperListPage(
                    subject: subject,
                  ))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            gradient: LinearGradient(colors: [
              index.isEven ? Colors.blue[300] : Colors.green,
              index.isEven ? Colors.green : Colors.blue[300],
            ]),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: Image.asset(
                    model.getSubjectAvatar(code: subject.code.toUpperCase()))),
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
                    style: TextStyle(color: Colors.red),
                  ),
                  backgroundColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
