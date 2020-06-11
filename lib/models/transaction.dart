enum TransactionType {
    INCOME,
    EXPENDITURE,

}

class Transaction {
    String _id;
    String _title;
    TransactionType _transactionType;
    double _amount;
    DateTime _dateTime;

    Transaction(this._id, this._title, this._transactionType, this._amount, this._dateTime);
}