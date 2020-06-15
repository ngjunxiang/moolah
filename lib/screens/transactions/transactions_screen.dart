import 'package:flutter/material.dart';
import 'package:moolah/models/transaction.dart';
import 'package:provider/provider.dart';

import './components/bar_chart.dart';
import './components/transaction_list.dart';
import './components/transaction_modal.dart';
import '../../components/speed_dial.dart';
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

  void _startAddNewTransaction(BuildContext context, TransactionType transactionType) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: TransactionModal(),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final _speedDial = SpeedDial(_startAddNewTransaction);
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
              _speedDial.close();
            },
            child: SafeArea(
              bottom: false,
              child: Stack(
                children: <Widget>[
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
                  _speedDial,
                ],
              ),
            ),
          );
  }
}
