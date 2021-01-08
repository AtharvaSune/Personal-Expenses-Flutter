import 'package:PersonalExpenses/widgets/chart-bars.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  String _getDay(DateTime day) {
    const dayMap = {
      "1": "Mon",
      "2": "Tue",
      "3": "Wed",
      "4": "Thu",
      "5": "Fri",
      "6": "Sat",
      "7": "Sun"
    };

    return dayMap[day.weekday.toString()];
  }

  double get weeklyTotalAmount {
    return weeklyTransactionList.fold(
        0.0, (sum, element) => sum + element['amount']);
  }

  List<Map<String, Object>> get weeklyTransactionList {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );
      double totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        var currTransaction = recentTransactions[i];

        if (currTransaction.date.weekday == weekDay.weekday &&
            currTransaction.date.month == weekDay.month &&
            currTransaction.date.year == weekDay.year) {
          totalSum += currTransaction.amount;
        }
      }

      return {
        "day": _getDay(weekDay),
        "amount": totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    var recentTransaction = weeklyTransactionList;

    print(recentTransaction);

    return Card(
      child: Row(
        children: recentTransaction.map((tx) {
          return ChartBars(
              tx['day'],
              tx['amount'],
              weeklyTotalAmount == 0.0
                  ? 0.0
                  : (tx['amount'] as double) / weeklyTotalAmount);
        }).toList(),
      ),
    );
  }
}
