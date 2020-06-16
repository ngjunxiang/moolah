import 'package:flutter/material.dart';
import 'package:moolah/models/transaction.dart';
import 'package:moolah/themes/style.dart';
import 'package:simple_animations/simple_animations.dart';

class Bar extends StatelessWidget {
  final double height;
  final String label;
  final double barLabel;
  final Map<ExpenseType, double> expenseData;

  final int _baseDurationMs = 1000;
  final double _maxElementHeight = 160;

  const Bar(this.label, this.barLabel, this.height, this.expenseData);

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
              barLabel == 0.0 ? '' : '\$${barLabel.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
            ...expenseData.entries.map((entry) => Container(
              width: 25,
              height: animatedHeight * _maxElementHeight * entry.value / barLabel,
              color: ExpenseColors().getTypeColor(entry.key),
            )).toList(),
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
