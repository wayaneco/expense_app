import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: ListView.builder(
              itemBuilder: (_, index) {
                return TransactionItem(
                    title: transactions[index].title,
                    amount: transactions[index].amount,
                    date: transactions[index].date);
              },
              itemCount: transactions.length,
            )));
  }
}
