import 'package:flutter/material.dart';

import './user_transactions.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense App')),
      body: const UserTransactions(),
    );
  }
}
