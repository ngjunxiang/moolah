import 'package:flutter/material.dart';
import 'package:moolah/models/transaction.dart';

import './components/bar_chart.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({Key key}) : super(key: key);

  List<Transaction> transactions = [
    Transaction(
        '1', 'Test Txn 1', TransactionType.EXPENDITURE, 52.50, DateTime.now()),
    Transaction('1', 'Test Txn 2', TransactionType.EXPENDITURE, 73.85,
        DateTime.parse('2020-06-10 00:00:00.000')),
    Transaction('1', 'Test Txn 3', TransactionType.EXPENDITURE, 22.35,
        DateTime.parse('2020-06-09 00:00:00.000')),
    Transaction('1', 'Test Txn 4', TransactionType.EXPENDITURE, 10.99,
        DateTime.parse('2020-06-08 00:00:00.000')),
    Transaction('1', 'Test Txn 4', TransactionType.EXPENDITURE, 100.85,
        DateTime.parse('2020-06-07 00:00:00.000')),
    Transaction('1', 'Test Txn 4', TransactionType.EXPENDITURE, 40.56,
        DateTime.parse('2020-06-06 00:00:00.000')),
    Transaction('1', 'Test Txn 4', TransactionType.EXPENDITURE, 30.00,
        DateTime.parse('2020-06-05 00:00:00.000')),
  ];

  Widget _buildHeader(BuildContext context, double availableHeight) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Text(
        'Recent Transactions',
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;

    final pageBody = SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildHeader(context, availableHeight),
            BarChart(transactions),
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: pageBody,
    );
  }
}
