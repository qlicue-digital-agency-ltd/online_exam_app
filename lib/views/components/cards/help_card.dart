import 'package:flutter/material.dart';

typedef HelpCardOnTap = Function();

class HelpCard extends StatelessWidget {
  final HelpCardOnTap onTap;
  final IconData icon;
  final String title;

  const HelpCard(
      {Key key,
      @required this.onTap,
      @required this.icon,
      @required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Container(
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
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.green,
          ),
          title: Text(title),
        ),
      ),
    );
  }
}
