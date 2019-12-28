import 'package:flutter/material.dart';

class CustomDoubleButtons extends StatelessWidget {
  final String titleButtonOne;
  final String titleButtonTwo;

  const CustomDoubleButtons(
      {Key key, @required this.titleButtonOne, @required this.titleButtonTwo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[500],
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: Center(
                    child: Text(
                  titleButtonOne,
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[500],
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: Center(
                    child: Text(
                  titleButtonTwo,
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
