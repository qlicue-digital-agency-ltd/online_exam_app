import 'package:flutter/material.dart';
import 'package:online_exam_app/model/grade.dart';

typedef GradeDropdownButtonOnChange = Function(Grade);

class GradeDropdown extends StatelessWidget {
  final GradeDropdownButtonOnChange onChange;
  final Grade value;

  final String title;
  final List<Grade> items;

  const GradeDropdown(
      {Key key,
      @required this.value,
      @required this.items,
      this.title = 'Grade\t',
      @required this.onChange})
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
          Expanded(
            flex: 2,
            child: RichText(
              text: TextSpan(
                  children: [
                    TextSpan(text: title),
                    TextSpan(text: '*', style: TextStyle(color: Colors.red))
                  ],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(
            flex: 3,
            child: DropdownButton(
              isExpanded: true,
              hint: Text(
                '--- Select Grade ---',
                overflow: TextOverflow.ellipsis,
              ),
              iconSize: 35,
              value: value,
              iconDisabledColor: Colors.red,
              iconEnabledColor: Colors.white,
              items: items.map((grade) {
                return DropdownMenuItem(
                  value: grade,
                  child: Text(grade.name, style: TextStyle(color: Colors.black),),
                );
              }).toList(),
              onChanged: (newValue) => onChange(newValue),
            ),
          ),
        ],
      ),
    );
  }
}
