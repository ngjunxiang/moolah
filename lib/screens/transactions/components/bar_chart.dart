import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './bar.dart';
import '../../../models/transaction.dart';
import '../transactions_screen.dart';

class BarChart extends StatelessWidget {
  final List<Transaction> pastWeekTransactions;

  const BarChart(this.pastWeekTransactions);

  List<Map> get pastWeekTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      final expenseData = {
        ExpenseType.Bills: 0.0,
        ExpenseType.Food: 0.0,
        ExpenseType.Transportation: 0.0,
        ExpenseType.Retail: 0.0,
      };

      double totalSum = 0;
      for (var t in pastWeekTransactions) {
        if (t.dateTime.day == weekday.day &&
            t.dateTime.month == weekday.month &&
            t.dateTime.year == weekday.year) {
          totalSum += t.amount;

          if (t.transactionType == TransactionType.Expense) {
            expenseData.update(t.expenseType, (value) => value + t.amount);
          }
        }
      }

      return {
        'day': DateFormat.E().format(weekday).substring(0, 3),
        'amount': totalSum,
        'expenseData': expenseData,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return pastWeekTransactionValues.fold(
        0.0, (max, t) => t['amount'] > max ? t['amount'] : max);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TransactionsScreen.chartHeight,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: pastWeekTransactionValues.map((t) {
            return Bar(
              t['day'],
              t['amount'],
              maxSpending == 0.0 ? 0.0 : t['amount'] / maxSpending,
              t['expenseData'],
            );
          }).toList(),
        ),
      ),
    );
  }
}
