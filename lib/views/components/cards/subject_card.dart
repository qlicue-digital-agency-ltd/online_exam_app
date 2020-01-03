import 'package:flutter/material.dart';
import 'package:online_exam_app/model/subject.dart';

typedef SubjectCardOnTap = Function();

class SubjectCard extends StatelessWidget {
  final String icon;
  final Subject subject;
  final SubjectCardOnTap onTap;

  const SubjectCard(
      {Key key,
      @required this.icon,
      @required this.subject,
      @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF17ead9), Colors.green]),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]
            ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                icon,
                height: 40,
              ),
              flex: 1,
            ),
            Expanded(
              child: Text(subject.name,
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
