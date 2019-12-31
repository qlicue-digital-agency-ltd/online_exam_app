import 'package:flutter/material.dart';
import 'package:online_exam_app/model/result.dart';

class RankCard extends StatelessWidget {
  final Result result;

  const RankCard({Key key, @required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.pink, borderRadius: BorderRadius.circular(15)),
      height: 80,
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              result.position.toString(),
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: 20,
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
