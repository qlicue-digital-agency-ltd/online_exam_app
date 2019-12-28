import 'package:flutter/material.dart';

class RankCard extends StatelessWidget {
  final int rank;

  const RankCard({Key key, @required this.rank}) : super(key: key);
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
              rank.toString(),
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
            backgroundImage: AssetImage('assets/icon/girl.png'),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Text("CICI MTOTO WAdsfdscds MOTO",
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
    );
  }
}
