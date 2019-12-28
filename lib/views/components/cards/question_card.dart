import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: RichText(
                  text: TextSpan(
                      text: 'Qn 1. \t',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                    TextSpan(
                        text:
                            '\nChocolate lemon drops muffin tart croissant sugar plum jelly-o lemon drops chocolate cake. Pie topping cupcake apple pie tootsie roll lemon drops. Pudding cupcake chocolate cake tiramisu gummies sweet halvah topping fruitcake. ?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal))
                  ])),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Image.asset('assets/icon/abacus.png'),
        ),
      ],
    );
  }
}
