import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:tinycolor/tinycolor.dart';

class Bar extends StatelessWidget {
  final double height;
  final String label;
  final String barLabel;

  final int _baseDurationMs = 1000;
  final double _maxElementHeight = 160;

  const Bar(this.label, this.barLabel, this.height);

  @override
  Widget build(BuildContext context) {
    return PlayAnimation(
      duration: Duration(milliseconds: (height * _baseDurationMs).round()),
      tween: Tween(begin: 0.0, end: height),
      builder: (context, child, animatedHeight) {
        return Column(
          children: <Widget>[
            Container(
              height: (1 - animatedHeight) * _maxElementHeight,
            ),
            Text(
              barLabel == '0.00' ? '' : '\$$barLabel',
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
            Container(
              width: 25,
              height: animatedHeight * _maxElementHeight,
              color: TinyColor.fromString('#9FB798').darken(20).color,
            ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        );
      },
    );
  }
}
