import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/transaction.dart';

class TransactionModal extends StatefulWidget {
  final TransactionType transactionType;

  TransactionModal(this.transactionType);

  @override
  _TransactionModalState createState() => _TransactionModalState();
}

class _TransactionModalState extends State<TransactionModal> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _addNewTransaction(
      String transactionTitle,
      TransactionType transactionType,
      double transactionAmount,
      DateTime selectedDate) {
//      final newTransaction = Transaction(
//          title: transactionTitle,
//          amount: transactionAmount,
//          date: selectedDate,
//          id: DateTime.now().toString(),
//      );
//
//      setState(() {
//          _userTransactionsList.add(newTransaction);
//      });
  }

  void _submitTransaction(BuildContext context) {
    if (_amountController.text.isEmpty) {
      return;
    }

    final inputTitle = _titleController.text;
    final inputAmount = double.parse(_amountController.text);

    if (inputTitle.isEmpty || inputAmount <= 0 || _selectedDate == null) {
      return;
    }

    _addNewTransaction(
        inputTitle, widget.transactionType, inputAmount, _selectedDate);

    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Transaction added!'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () => null,
        ),
      ),
    );

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = selectedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        mediaQuery.padding.bottom;
    return Container(
      height: availableHeight * 0.6,
      padding: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: mediaQuery.padding.bottom + 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitTransaction(context),
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitTransaction(context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'No date chosen!'
                          : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}'),
                    ),
                    RaisedButton(
                        textColor: Theme.of(context).primaryColor,
                        child: const Text(
                          'Choose Date',
                        ),
                        onPressed: _showDatePicker),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              child: const Text(
                'Add Transaction',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textColor: Theme.of(context).textTheme.button.color,
              color: Theme.of(context).buttonColor,
              onPressed: () => _submitTransaction(context),
            ),
          ),
        ],
      ),
    );
  }
}
