import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
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
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
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
