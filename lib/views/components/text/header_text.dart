import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String title;

  const HeaderText({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.green),
        )),
      ],
    );
  }
}
