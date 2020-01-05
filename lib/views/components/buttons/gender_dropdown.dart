import 'package:flutter/material.dart';
import 'package:online_exam_app/model/gender.dart';

typedef GenderDropdownButtonOnChange = Function(Gender);

class GenderDropdown extends StatelessWidget {
  final GenderDropdownButtonOnChange onChange;
  final Gender value;

  final String title;
  final List<Gender> items;

  const GenderDropdown(
      {Key key,
      @required this.value,
      @required this.items,
      this.title = 'Gender\t',
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
                '--- Select Gender ---',
                overflow: TextOverflow.ellipsis,
              ),
              iconSize: 35,
              value: value,
              iconDisabledColor: Colors.red,
              iconEnabledColor: Colors.white,
              items: items.map((gender) {
                return DropdownMenuItem(
                  value: gender,
                  child: Text(gender.name, style: TextStyle(color: Colors.black),),
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
