import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final DateTime date;
  final double amount;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}