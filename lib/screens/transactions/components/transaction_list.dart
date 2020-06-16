import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/transaction.dart';
import '../../../themes/style.dart';

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
                      DateFormat.yMMMMEEEEd().format(t.dateTime),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ];
                }
                res.add(
                  Dismissible(
                    key: ValueKey(t.id),
                    background: Container(
                      color: Theme.of(context).errorColor,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 30,
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(
                        right: 10,
                      ),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 4,
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) {
                      return showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Are you sure?'),
                          content: Text(
                              'Do you want to remove this item from the cart?'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(ctx).pop(false),
                              child: Text('No'),
                            ),
                            FlatButton(
                              onPressed: () => Navigator.of(ctx).pop(true),
                              child: Text('Yes'),
                            ),
                          ],
                        ),
                      );
                    },
                    onDismissed: (direction) {
//                      Provider.of<Cart>(
//                        context,
//                        listen: false,
//                      ).removeCartItem(productId);
                    },
                    child: ListTile(
                      leading: Container(
                        height: double.infinity,
                        width: 5,
                        color: ExpenseColors().getTypeColor(t.expenseType),
                      ),
                      title:
                          Text(
                            t.title,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),

                      subtitle: Text(t.transactionType == TransactionType.Income
                          ? describeEnum(t.transactionType)
                          : describeEnum(t.expenseType)),
                      trailing: Text('\$${t.amount.toStringAsFixed(2)}'),
                    ),
                  ),
                );
                return Column(
                  children: <Widget>[...res],
                );
              }).toList(),
            ),
    );
  }
}
