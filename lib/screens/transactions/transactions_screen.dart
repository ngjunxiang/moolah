import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './components/bar_chart.dart';
import './components/transaction_list.dart';
import '../../providers/transactions_provider.dart';

class TransactionsScreen extends StatelessWidget {
  static final headerHeight = 50.0;
  static final chartHeight = 220.0;

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: TransactionsScreen.headerHeight,
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

  Widget _buildAddButton(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(
          Icons.add,
          color: Theme.of(context).textTheme.button.color,
        ),
        backgroundColor: Theme.of(context).buttonColor,
      ),
    );
  }

  void _startAddNewTransaction(BuildContext context) {
    print('add new txn');
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final _transactionsProvider =
        Provider.of<TransactionsProvider>(context, listen: true);

    if (_transactionsProvider.status == TransactionsLoadingStatus.NotLoaded) {
      _transactionsProvider.fetchTransactions();
    }

    return _transactionsProvider.status != TransactionsLoadingStatus.Loaded
        ? Center(
            child: CircularProgressIndicator(),
          )
        : GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SafeArea(
              bottom: false,
              child: Stack(
                children: <Widget>[
                  _buildAddButton(context),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _buildHeader(context),
                      BarChart(_transactionsProvider.transactions.where((t) {
                        return t.dateTime.isAfter(
                          DateTime.now().subtract(
                            Duration(days: 7),
                          ),
                        );
                      }).toList()),
                      Divider(),
                      TransactionList(_transactionsProvider.transactions),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
