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
            delegate: SliverChildListDelegate([
              SubjectCard(
                icon: Icons.pets,
                name: 'Math',
              ),
              SubjectCard(
                icon: Icons.phone,
                name: 'English',
              ),
              SubjectCard(
                icon: Icons.book,
                name: 'Swahili',
              )
            ]),
          )
        ],
      ),
      drawer: Container(),
    );
  }
}
