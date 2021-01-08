import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:flutter/rendering.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;

  TransactionList(this._userTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: _userTransaction.length,
        itemBuilder: (context, index) {
          var transaction = _userTransaction[index];
          return Card(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                AmountContainer(transaction.amount),
                TransactionDetails(transaction.title, transaction.date),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AmountContainer extends StatelessWidget {
  final double _amount;

  AmountContainer(this._amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColorDark,
          width: 2,
        ),
      ),
      child: Text(
        '\$' + _amount.toStringAsFixed(2),
        style: TextStyle(
          color: Theme.of(context).primaryColorDark,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TransactionDetails extends StatelessWidget {
  final String _title;
  final DateTime _date;

  TransactionDetails(this._title, this._date);

  String _parseDate(DateTime date) {
    const Map<String, String> monthMap = {
      '01': 'January',
      '02': 'February',
      '03': 'March',
      '04': 'April',
      '05': 'May',
      '06': 'June',
      '07': 'July',
      '08': 'August',
      '09': 'September',
      '10': 'October',
      '11': 'November',
      '12': 'December'
    };

    List<String> parsed = date.toString().split(" ")[0].split("-");

    String year = parsed[0], month = monthMap[parsed[1]], currDate = parsed[2];

    return month + " " + currDate + ", " + year;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            _title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          Text(
            _parseDate(_date),
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
