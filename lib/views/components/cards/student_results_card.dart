import 'package:flutter/material.dart';
import 'package:online_exam_app/model/result.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:intl/intl.dart';

class StudentResultsCard extends StatelessWidget {
  final Result result;
  final MainModel model;

  const StudentResultsCard(
      {Key key, @required this.result, @required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      elevation: 2,
      child: ListTile(
        onTap: (){
          print('object');
        },
        leading: Chip(
          label: Text(result.score.toString() + "%",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.w600)),
        ),
        title: Text(result.subjectName.toUpperCase(),
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
        subtitle: Text(
            'Taken on\t' +
                DateFormat(
                  'dd-MM-yyyy',
                ).format(DateTime.parse(result.date)).toString(),
            style: TextStyle(
              color: Colors.white,
            )),
        trailing: Text(
            result.position.toString() + '\t/\t' + result.candidates.toString(),
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
      ),
    );

    // InkWell(
    //   onTap: () {},
    //   child: Container(
    //     decoration: BoxDecoration(
    //         color: Colors.green, borderRadius: BorderRadius.circular(15)),
    //     height: 80,
    //     child: Row(
    //       children: <Widget>[
    //         SizedBox(
    //           width: 5,
    //         ),
    //         SizedBox(
    //           width: 5,
    //         ),
    //         Expanded(
    //             flex: 2,
    //             child: Text(
    //                 result.subjectName +
    //                     "\n" +
    //                     DateFormat('yyyy-MM-dd')
    //                         .format(DateTime.parse(result.date))
    //                         .toString(),
    //                 style: TextStyle(
    //                     fontSize: 15,
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.w600))),
    //         VerticalDivider(
    //           color: Colors.white,
    //         ),
    //         Expanded(
    //           flex: 1,
    //           child: Padding(
    //             padding: const EdgeInsets.all(10.0),
    //             child: Text(
    //               "score\n" + result.score.toString() + "%",
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontSize: 15,
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.w600),
    //             ),
    //           ),
    //         ),
    //         VerticalDivider(
    //           color: Colors.white,
    //         ),
    //         Expanded(
    //           flex: 2,
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(
    //               "Position\n" +
    //                   result.position.toString() +
    //                   '\t/\t' +
    //                   result.candidates.toString(),
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                   fontSize: 15,
    //                   color: Colors.white,
    //                   fontWeight: FontWeight.w600),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
