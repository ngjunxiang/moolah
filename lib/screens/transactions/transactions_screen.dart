import 'package:flutter/material.dart';

import './components/bar_chart.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key key}) : super(key: key);

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
            BarChart(),
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
