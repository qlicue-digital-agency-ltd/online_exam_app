import 'package:flutter/material.dart';

class PastPaperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Papers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            itemCount: 6,
            gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemBuilder: (BuildContext context, int index) => Container(
                  color: Colors.teal,
                 
                )),
      ),
    );
  }
}
