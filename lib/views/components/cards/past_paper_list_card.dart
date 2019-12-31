import 'package:flutter/material.dart';
import 'package:online_exam_app/model/examination.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/pages/paper_page.dart';

class PastPaperListCard extends StatelessWidget {
  final Examination examination;
  final MainModel model;

  const PastPaperListCard(
      {Key key, @required this.examination, @required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => PaperPage(
                      model: model,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(15)),
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
                child: Text("SPE/2019/0001/MT",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "90%",
                style: TextStyle(
                    fontSize: 20,
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
