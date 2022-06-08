import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart({Key? key, required this.recentTransactions}) : super(key: key);

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSpent = 0.0;

      recentTransactions.forEach((tx) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSpent += tx.amount;
        }
      });

      return {
        'day': DateFormat.E().format(weekDay).substring(0),
        'amount': totalSpent,
      };
    }).reversed.toList();
  }

  double get totalSpentInAWeek {
    return groupedTransactionValues.fold(
        0.0, (total, tx) => total += tx['amount'] as double);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Theme.of(context).primaryColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Column(children: [
          Container(
            child: Center(
              child: Text(
                'Money spent in the last 7 days',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactionValues.map(
              (tx) {
                return Bar(
                  tx['day'] as String,
                  (tx['amount'] ?? 0.0) as double,
                  (tx['amount'] as double) / totalSpentInAWeek,
                );
              },
            ).toList(),
          )
        ]),
      ),
    );
  }
}
