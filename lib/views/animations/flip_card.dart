import 'dart:math';
import 'package:flutter/material.dart';
import 'package:online_exam_app/model/scoped/main.dart';

class FlipInYCard extends StatelessWidget {
  FlipInYCard({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(animation.value),
          alignment: Alignment.center,
          child: child,
        );
      },
      child: child,
    );
  }
}

class FlipCard extends StatefulWidget {
  final Widget front;
  final Widget back;
  final MainModel model;

  const FlipCard(
      {Key key,
      @required this.front,
      @required this.back,
      @required this.model})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FlipCardState();
  }
}

class FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  Animation<double> _frontRotation;
  Animation<double> _backRotation;

  @override
  void initState() {
    super.initState();
    widget.model.animationController = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _frontRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.0, end: pi / 2)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
      ],
    ).animate(widget.model.controllerFlipCard);
    _backRotation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: ConstantTween<double>(pi / 2),
          weight: 50.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: -pi / 2, end: 0.0)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 50.0,
        ),
      ],
    ).animate(widget.model.controllerFlipCard);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FlipInYCard(
            animation: _frontRotation,
            child: widget.front,
          ),
          FlipInYCard(
            animation: _backRotation,
            child: widget.back,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.model.controllerFlipCard.dispose();
    super.dispose();
  }
}
