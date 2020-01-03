import 'package:flutter/material.dart';
import 'package:online_exam_app/model/result.dart';

class RankCard extends StatelessWidget {
  final Result result;

  const RankCard({Key key, @required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    gradient: LinearGradient(
                        colors: [Colors.green[700], Colors.green[300]]),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF6078ea).withOpacity(.3),
                          offset: Offset(0.0, 8.0),
                          blurRadius: 8.0)
                    ]),
                width: 40,
                height: 40,
                child: Text(
                  result.position.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
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
          CircleAvatar(
            backgroundImage: AssetImage(
                result.student.gender.toLowerCase() == 'male'
                    ? 'assets/icon/boy.png'
                    : 'assets/icon/girl.png'),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Text(result.student.name,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w600))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              result.score.toString() + "%",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
