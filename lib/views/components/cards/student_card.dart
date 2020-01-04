import 'package:flutter/material.dart';

import 'package:online_exam_app/model/student.dart';

typedef StudentCardOnTap = Function();

class StudentCard extends StatelessWidget {
  final Student student;

  final StudentCardOnTap onTap;
  const StudentCard({Key key, @required this.student, @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            gradient: LinearGradient(colors: [
              Color(0xFF17ead9),
              Colors.green[700],
            ]),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        height: 80,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: CircleAvatar(
                backgroundImage: AssetImage(
                    student.gender.toLowerCase() == 'male'
                        ? 'assets/icon/boy.png'
                        : 'assets/icon/girl.png'),
              )),
            ),
            SizedBox(
              width: 5,
            ),
            VerticalDivider(
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
                child: Text(student.name,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600))),
          ],
        ),
      ),
    );
  }
}
