library optainer_animation;

import 'package:flutter/material.dart';

class OptainerAnimation extends StatelessWidget {
  final double tweenStart,
      tweenEnd,
      leftPaddingTweenMultiple,
      rightPaddingTweenMultiple,
      topPaddingTweenMultiple,
      bottomPaddingTweenMultiple;
  final int durationInMillisecs;
  final Widget childWidget;
  const OptainerAnimation({
    required this.durationInMillisecs,
    required this.tweenStart,
    required this.tweenEnd,
    required this.childWidget,
    required this.leftPaddingTweenMultiple,
    required this.rightPaddingTweenMultiple,
    required this.topPaddingTweenMultiple,
    required this.bottomPaddingTweenMultiple,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      child: childWidget,
      duration: Duration(
        milliseconds: durationInMillisecs,
      ),
      tween: Tween<double>(
        begin: tweenStart,
        end: tweenEnd,
      ),
      builder: (BuildContext context, double _val, Widget? child) {
        return Opacity(
          opacity: _val,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              _val * leftPaddingTweenMultiple,
              _val * topPaddingTweenMultiple,
              _val * rightPaddingTweenMultiple,
              _val * bottomPaddingTweenMultiple,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
