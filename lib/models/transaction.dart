import 'package:flutter/foundation.dart';

import '../utils/enum_from_string.dart';

enum TransactionType {
  Income,
  Expense,
}

enum ExpenseType {
  Bills,
  Food,
  Retail,
  Transportation,
}

class Transaction {
  String _id;
  String _title;
  TransactionType _transactionType;
  ExpenseType _expenseType;
  double _amount;
  DateTime _dateTime;

  Transaction(this._id, this._title, this._transactionType, this._expenseType, this._amount,
      this._dateTime);

  String get id => _id;

  String get title => _title;

  TransactionType get transactionType => _transactionType;

  ExpenseType get expenseType => _expenseType;

  double get amount => _amount;

  DateTime get dateTime => _dateTime;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['transactionType'] = describeEnum(transactionType);
    map['expenseType'] = enumFromString(describeEnum(expenseType), ExpenseType);
    map['amount'] = amount.toString();
    map['dateTime'] = dateTime;

    return map;
  }

  Transaction.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['tag'];
    this._transactionType = map['transactionType'];
    this._expenseType = map['expenseType'];
    this._amount = double.parse(map['amount']);
    this._dateTime = DateTime.parse(map['dateTime']);
  }
}
