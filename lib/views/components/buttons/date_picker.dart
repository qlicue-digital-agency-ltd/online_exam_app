import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:online_exam_app/model/scoped/main.dart';

typedef CustomDateDropdownOnTap = Function();

class CustomDateDropdown extends StatelessWidget {
  final String title;
  final CustomDateDropdownOnTap onTap;
  final DateTime birthday;
  final bool isRequired;
  final MainModel model;

  const CustomDateDropdown(
      {Key key,
      this.isRequired = false,
      this.title = 'Date\t',
      @required this.model,
      @required this.onTap,
      @required this.birthday})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          gradient: LinearGradient(colors: [Colors.white, Colors.green]),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0xFF6078ea).withOpacity(.3),
                offset: Offset(0.0, 8.0),
                blurRadius: 8.0)
          ]),
      padding: EdgeInsets.only(left: 5),
      height: 50,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 2,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(text: title),
                TextSpan(
                    text: isRequired ? '*' : '',
                    style: TextStyle(color: Colors.red))
              ], style: TextStyle(color: Colors.black45)),
            ),
          ),
          Expanded(
              flex: 3,
              child: FlatButton(
                child: Text(birthday != null
                    ? DateFormat('dd/MM/yyyy')
                        .format(DateTime.parse(birthday.toString()))
                    : 'Select your birthday'),
                onPressed: onTap,
              )),
          IconButton(
              tooltip: 'Add a new Category',
              icon: Icon(
                Icons.arrow_drop_down,
                size: 40,
                color: Colors.white,
              ),
              onPressed: onTap),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
