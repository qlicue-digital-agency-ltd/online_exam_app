import 'package:flutter/material.dart';

class NoItemTile extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final double height;
  final double width;

  const NoItemTile(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.subtitle,
      this.height = 400,
      this.width = 300})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height/ 3,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: width / 3 + 40),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(icon, height: width / 3),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(color: Colors.black54, fontSize: 20),
                text: title,
                children: <TextSpan>[
                  TextSpan(
                    text: '\n',
                  ),
                  TextSpan(
                    text: subtitle,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
