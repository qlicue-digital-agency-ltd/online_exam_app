import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
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
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('0',
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
                      style: TextStyle(color: Colors.white),
                    ),
                    Text('0 %',
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
