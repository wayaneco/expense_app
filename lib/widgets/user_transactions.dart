import 'package:flutter/material.dart';

import './transaction_list.dart';
import './add_transactions.dart';
import './chart.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        id: DateTime.now().toString(),
        title: 'Levis Short',
        amount: 20.0,
        date: DateTime.now().subtract(const Duration(days: 2))),
    Transaction(
        id: DateTime.now().toString(),
        title: 'Xiaomi Redmi Note 11',
        amount: 1.19,
        date: DateTime.now().subtract(const Duration(days: 2)))
  ];

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 180,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Chart(
              recentTransactions: _transactions,
            ),
          ),
          _transactions.isNotEmpty
              ? TransactionList(
                  transactions: _transactions,
                  deleteTransaction: _deleteTransaction)
              : Container(
                  color: Colors.red,
                ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).primaryColor,
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 40,
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: AddTransaction(
                      addNewTransaction: _addNewTransaction,
                    ),
                  );
                });
          },
          child: const Icon(Icons.add)),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
