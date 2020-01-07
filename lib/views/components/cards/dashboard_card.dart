import 'package:flutter/material.dart';
import 'package:online_exam_app/model/result.dart';
import 'package:online_exam_app/model/scoped/main.dart';

class DashboardCard extends StatelessWidget {
  final List<Result> results;
  final MainModel model;

  const DashboardCard({Key key, @required this.results, @required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          gradient: LinearGradient(colors: [
            Colors.blue[300],
            Colors.green,
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
          Expanded(
            child: InkWell(
              onTap: () {
                print('object');
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Test Taken',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(results.length.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20))
                  ],
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: Colors.white,
          ),
          Expanded(
            child: InkWell(
              onTap: () {},
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Average Marks',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                        model.availableResults.isNotEmpty
                            ? model.averageResult().toString() + ' %'
                            : "0" + ' %',
                        style: TextStyle(color: Colors.white, fontSize: 20))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
