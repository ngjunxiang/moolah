import 'package:flutter/foundation.dart';
import 'package:moolah/models/transaction.dart';

enum TransactionsLoadingStatus {
  NotLoaded,
  Loaded,
}

class TransactionsProvider with ChangeNotifier {
  TransactionsLoadingStatus _status = TransactionsLoadingStatus.NotLoaded;
  List<Transaction> _transactionsList;

  TransactionsLoadingStatus get status => _status;
  List<Transaction> get transactions => _transactionsList;

//      List<Transaction>.from(_transactionsList);

  Future<void> fetchTransactions() async {
    await Future.delayed(const Duration(milliseconds: 100), (){});
    final fetchedTransactions = [
      Transaction('1', 'Test Txn 1', TransactionType.EXPENDITURE, 52.50,
          DateTime.now()),
      Transaction('1', 'Test Txn 2', TransactionType.EXPENDITURE, 73.85,
          DateTime.parse('2020-06-10 00:00:00.000')),
      Transaction('1', 'Test Txn 3', TransactionType.EXPENDITURE, 22.35,
          DateTime.parse('2020-06-09 00:00:00.000')),
      Transaction('1', 'Test Txn 4-1', TransactionType.EXPENDITURE, 10.99,
          DateTime.parse('2020-06-08 00:00:00.000')),
      Transaction('1', 'Test Txn 4-2', TransactionType.EXPENDITURE, 20.21,
          DateTime.parse('2020-06-08 01:00:00.000')),
      Transaction('1', 'Test Txn 5', TransactionType.EXPENDITURE, 100.85,
          DateTime.parse('2020-06-07 00:00:00.000')),
      Transaction('1', 'Test Txn 6', TransactionType.EXPENDITURE, 40.56,
          DateTime.parse('2020-06-06 20:05:00.000')),
      Transaction('1', 'Test Txn 7', TransactionType.EXPENDITURE, 30.00,
          DateTime.parse('2020-06-05 00:00:00.000')),
    ];

    fetchedTransactions.sort((a, b) => -a.dateTime.compareTo(b.dateTime));

    _transactionsList = fetchedTransactions;
    _status = TransactionsLoadingStatus.Loaded;

    notifyListeners();
  }
}
