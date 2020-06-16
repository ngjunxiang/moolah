import 'package:flutter/foundation.dart';

import '../models/transaction.dart';

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
    await Future.delayed(const Duration(milliseconds: 100), () {});
    final fetchedTransactions = [
      Transaction(
        '1',
        'Test Txn 1',
        TransactionType.Expense,
        ExpenseType.Bills,
        52.50,
        DateTime.now(),
      ),
      Transaction(
        '1',
        'Test Txn 2',
        TransactionType.Expense,
        ExpenseType.Retail,
        73.85,
        DateTime.now().subtract(
          Duration(days: 1),
        ),
      ),
      Transaction(
        '1',
        'Test Txn 3',
        TransactionType.Expense,
        ExpenseType.Retail,
        22.35,
        DateTime.now().subtract(
          Duration(days: 2),
        ),
      ),
      Transaction(
        '1',
        'Test Txn 4-1',
        TransactionType.Expense,
        ExpenseType.Food,
        10.99,
        DateTime.now().subtract(
          Duration(days: 3),
        ),
      ),
      Transaction(
        '1',
        'Test Txn 4-2',
        TransactionType.Expense,
        ExpenseType.Food,
        20.21,
        DateTime.now().subtract(
          Duration(days: 4),
        ),
      ),
      Transaction(
        '1',
        'Test Txn 5',
        TransactionType.Expense,
        ExpenseType.Retail,
        100.85,
        DateTime.now().subtract(
          Duration(days: 5),
        ),
      ),
      Transaction(
        '1',
        'Test Txn 6',
        TransactionType.Expense,
        ExpenseType.Bills,
        40.56,
        DateTime.now().subtract(
          Duration(days: 6),
        ),
      ),
      Transaction(
        '1',
        'Test Txn 7',
        TransactionType.Expense,
        ExpenseType.Transportation,
        30.00,
        DateTime.now().subtract(
          Duration(days: 3),
        ),
      ),
    ];

    fetchedTransactions.sort((a, b) => -a.dateTime.compareTo(b.dateTime));

    _transactionsList = fetchedTransactions;
    _status = TransactionsLoadingStatus.Loaded;

    notifyListeners();
  }
}
