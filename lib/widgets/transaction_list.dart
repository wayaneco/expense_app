import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  void Function(String)? deleteTransaction;

  TransactionList(
      {Key? key, required this.transactions, this.deleteTransaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 30),
        child: ListView.builder(
          itemBuilder: (_, index) {
            return TransactionItem(
                id: transactions[index].id,
                title: transactions[index].title,
                amount: transactions[index].amount,
                date: transactions[index].date,
                deleteTransaction: deleteTransaction);
          },
          itemCount: transactions.length,
        ),
      ),
    );
  }
}
