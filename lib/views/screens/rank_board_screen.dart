import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';
import 'package:online_exam_app/views/components/cards/rank_card.dart';
import 'package:online_exam_app/views/components/tiles/no_item.dart';
import 'package:scoped_model/scoped_model.dart';

class RankBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.availableTopTen.isNotEmpty
            ? ListView.builder(
                itemBuilder: (BuildContext context, int index) => index < 10
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RankCard(
                          result: model.availableTopTen[index],
                        ),
                      )
                    : Container(),
                itemCount: model.availableTopTen.length,
              )
            : Container(
                child: Center(
                  child: NoItemTile(
                    icon: 'assets/icon/ranking.png',
                    title: 'Hello!',
                    subtitle: 'There are No Ranks at the Moment',
                  ),
                ),
              );
      },
    );
  }
}
