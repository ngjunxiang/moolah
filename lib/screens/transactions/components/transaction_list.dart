import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    DateTime currentDate;
    return Expanded(
      child: _transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'No transactions yet!',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              );
            })
          : ListView(
              children: _transactions.map((t) {
                List<Widget> res = [];
                if (currentDate == null ||
                    currentDate.day != t.dateTime.day ||
                    currentDate.month != t.dateTime.month ||
                    currentDate.year != t.dateTime.year) {
                  currentDate = t.dateTime;
                  res = [
                    Text(
                      DateFormat(DateFormat.MONTH_WEEKDAY_DAY)
                          .format(t.dateTime),
                        style: Theme.of(context).textTheme.headline2,
                    ),
                  ];
                }
                res.add(ListTile(
                  title: Text(
                    t.title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  subtitle: Text(t.transactionType.toString()),
                  trailing: Text('\$${t.amount.toStringAsFixed(2)}'),
                ));
                return Column(
                  children: <Widget>[...res],
                );
              }).toList(),
            ),
    );
  }
}
