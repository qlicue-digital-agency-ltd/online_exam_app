import 'package:flutter/material.dart';
import 'package:online_exam_app/views/components/buttons/custom_double_buttons.dart';

class ExaminationSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              'Summary',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/icon/books.png'),
            SizedBox(
              height: 20,
            ),
            Text(
              'Total Questions Attempted',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '40/50',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/icon/books.png'),
            Text('Congraturations',
                style: TextStyle(fontSize: 18, color: Colors.green)),
            CustomDoubleButtons(
              titleButtonOne: 'Preview',
              titleButtonTwo: 'Submit',
            ),
             SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
