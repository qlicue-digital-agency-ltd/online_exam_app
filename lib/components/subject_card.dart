import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final IconData icon;
  final String name;

  const SubjectCard({Key key, @required this.icon, @required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Card(
        color: Colors.white,
        child: ListTile(
          leading: Icon(icon),
          title: Text(name),
        ),
      ),
    );
  }
}
