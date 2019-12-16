import 'package:flutter/material.dart';
import 'package:online_exam_app/components/subject_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QUIZ APP'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              print('Hellooo');
            },
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.orange,
                  child: ListTile(
                    leading: Icon(Icons.person_add),
                    title: Text('Tanzania'),
                    trailing: Icon(Icons.person_pin_circle),
                  ),
                ),
              )
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return SubjectCard(
                icon: Icons.book,
                name: 'Swahili',
              );
            }, childCount: 10),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: RaisedButton(
                child: Text('Subscribe'),
                onPressed: () {
                  print('Go n subscribe');
                },
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      drawer: Container(),
    );
  }
}
