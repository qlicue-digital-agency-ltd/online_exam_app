import 'package:flutter/material.dart';
import 'package:online_exam_app/views/components/cards/rank_card.dart';

class RankBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RankCard(
          rank: index + 1,
        ),
      ),
      itemCount: 10,
    );
  }
}
