import 'package:flutter/material.dart';

import './transaction_list.dart';
import './add_transactions.dart';

import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [
    Transaction(
        id: '1', title: 'Levis Short', amount: 99.99, date: DateTime.now()),
    Transaction(
        id: '2',
        title: 'Xiaomi Redmi Note 11',
        amount: 695.19,
        date: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 100,
            child: const Center(child: Text('CHART!')),
          ),
        ),
        TransactionList(transactions: _transactions),
      ]),
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
