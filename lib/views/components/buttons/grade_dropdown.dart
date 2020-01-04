import 'package:flutter/material.dart';
import 'package:online_exam_app/model/grade.dart';

typedef GradeDropdownButtonOnTap = Function();
typedef GradeDropdownButtonOnChange = Function(Grade);

class GradeDropdown extends StatelessWidget {
  final GradeDropdownButtonOnTap onTap;
  final GradeDropdownButtonOnChange onChange;
  final Grade value;
  final bool showButton;
  final String title;
  final List<Grade> items;

  const GradeDropdown(
      {Key key,
      @required this.onTap,
      @required this.value,
      @required this.items,
      this.showButton = true,
      this.title = 'Grade\t',
      @required this.onChange})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Container(
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
                  TextSpan(text: '*', style: TextStyle(color: Colors.red))
                ], style: TextStyle(color: Colors.black45)),
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
                 iconDisabledColor: Colors.grey,
                iconEnabledColor: Theme.of(context).primaryColor,
                items: items.map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Text(role.name),
                  );
                }).toList(),
                onChanged: (newValue) => onChange(newValue),
              ),
            ),
            showButton
                ? IconButton(
                    tooltip: 'Add a new Grade',
                    icon: Icon(
                      Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => onTap(),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
