import 'package:flutter/material.dart';

import 'transactions/add-transaction.dart';
import 'transactions/transaction-list.dart';
import 'package:PersonalExpenses/models/transaction.dart';

class NewTransaction extends StatefulWidget {
  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final List<Transaction> _userTransactions = [];

  void _onPressed(String title, double amount) {
    final Transaction newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AddTransaction(_onPressed),
        TransactionList(_userTransactions),
      ],
    );
  }
}
