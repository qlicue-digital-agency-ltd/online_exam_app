import 'package:flutter/material.dart';
import 'package:online_exam_app/model/result.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:intl/intl.dart';

class MyResultsCard extends StatelessWidget {
  final Result result;
  final MainModel model;

  const MyResultsCard({Key key, @required this.result, @required this.model})
      : super(key: key);
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
                child: Text(
                    "name" +
                        "\n" +
                        DateFormat('yyyy-MM-dd')
                            .format(DateTime.parse(result.date))
                            .toString(),
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Position:\t" +
                    result.position.toString() +
                    '/' +
                    result.candidates.toString(),
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
